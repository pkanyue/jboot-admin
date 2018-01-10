package io.jboot.admin.base.plugin.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.util.Map;

/**
 * Shiro 工具类
 * gt.registerFunctionPackage("so",new ShiroUtils ());
 * 在模版中通过 so.isGuest() 
 * @author Rlax
 *
 */
public class ShiroUtils {
    /**
     * The guest tag
     *
     * @return
     */
    public static boolean isGuest() {
        return getSubject() == null || getSubject().getPrincipal() == null;
    }

    /**
     * The user tag
     *
     * @return
     */
    public static boolean isUser() {
        return getSubject() != null && getSubject().getPrincipal() != null;
    }

    /**
     * The authenticated tag
     *
     * @return
     */
    public static boolean isAuthenticated() {
        return getSubject() != null && getSubject().isAuthenticated();
    }

    public static boolean isNotAuthenticated() {
        return !isAuthenticated();
    }

    /**
     * The principal tag
     *
     * @param map
     * @return
     */
    public static String principal(Map<?, ?> map) {
        String strValue = null;
        if (getSubject() != null) {

            // Get the principal to print out
            Object principal;
            String type = map != null ? (String) map.get("type") : null;
            if (type == null) {
                principal = getSubject().getPrincipal();
            } else {
                principal = getPrincipalFromClassName(type);
            }
            String property = map != null ? (String) map.get("property") : null;
            // Get the string value of the principal
            if (principal != null) {
                if (property == null) {
                    strValue = principal.toString();
                } else {
                    strValue = getPrincipalProperty(principal, property);
                }
            }

        }

        if (strValue != null) {
            return strValue;
        } else {
            return null;
        }
    }

    /**
     * The hasRole tag
     *
     * @param roleName
     * @return
     */
    public static boolean hasRole(String roleName) {
        return getSubject() != null && getSubject().hasRole(roleName);
    }

    /**
     * The lacksRole tag
     *
     * @param roleName
     * @return
     */
    public static boolean lacksRole(String roleName) {
        boolean hasRole = getSubject() != null
                && getSubject().hasRole(roleName);
        return !hasRole;
    }

    /**
     * The hasAnyRole tag
     *
     * @param roleNames
     * @return
     */
    public static boolean hasAnyRole(String roleNames) {
        boolean hasAnyRole = false;

        Subject subject = getSubject();

        if (subject != null) {

            // Iterate through roles and check to see if the user has one of the
            // roles
            for (String role : roleNames.split(",")) {

                if (subject.hasRole(role.trim())) {
                    hasAnyRole = true;
                    break;
                }

            }

        }

        return hasAnyRole;
    }

    /**
     * The hasPermission tag
     *
     * @param p
     * @return
     */
    public static boolean hasPermission(String p) {
        return getSubject() != null && getSubject().isPermitted(p);
    }

    /**
     * The lacksPermission tag
     *
     * @param p
     * @return
     */
    public static boolean lacksPermission(String p) {
        return !hasPermission(p);
    }


    private static Object getPrincipalFromClassName(String type) {
        Object principal = null;

        try {
            Class<?> cls = Class.forName(type);
            principal = getSubject().getPrincipals().oneByType(cls);
        } catch (ClassNotFoundException e) {

        }
        return principal;
    }

    private static String getPrincipalProperty(Object principal, String property) {
        String strValue = null;

        try {
            BeanInfo bi = Introspector.getBeanInfo(principal.getClass());

            // Loop through the properties to get the string value of the
            // specified property
            boolean foundProperty = false;
            for (PropertyDescriptor pd : bi.getPropertyDescriptors()) {
                if (pd.getName().equals(property)) {
                    Object value = pd.getReadMethod().invoke(principal,
                            (Object[]) null);
                    strValue = String.valueOf(value);
                    foundProperty = true;
                    break;
                }
            }

            if (!foundProperty) {
                final String message = "Property [" + property
                        + "] not found in principal of type ["
                        + principal.getClass().getName() + "]";

                throw new RuntimeException(message);
            }

        } catch (Exception e) {
            final String message = "Error reading property [" + property
                    + "] from principal of type ["
                    + principal.getClass().getName() + "]";

            throw new RuntimeException(message, e);
        }

        return strValue;
    }

    protected static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    /**
     * 校验用户登录密码
     * @param newPwd 新未加密的密码
     * @param oldPwd 旧加密后的密码
     * @param oldSalt2 旧加密盐
     * @return true-校验一致 否则 false
     */
    public static boolean checkPwd(String newPwd, String oldPwd, String oldSalt2) {
        SimpleHash hash = new SimpleHash("md5", newPwd, oldSalt2, 2);
        return hash.toHex().equals(oldPwd);
    }
}
