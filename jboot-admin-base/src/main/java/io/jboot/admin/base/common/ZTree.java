package io.jboot.admin.base.common;

/**
 * ztree 基本model
 * 
 * @author Rlax
 * 
 */
public class ZTree implements java.io.Serializable {

	private static final long serialVersionUID = 6625307952110627894L;
	private Long id;
	private Long pId;
	private String name;
	private boolean open = true;
	private boolean checked = false;
	private boolean chkDisabled = false;

	public ZTree(Long id, String name, Long pid) {
		this.id = id;
		this.name = name;
		this.pId = pid;
	}

	public void setDisCheck(boolean b) {
		if (b) {
			checked = true;
			chkDisabled = true;
		} else {
			chkDisabled = false;
			checked = false;
		}
	}
	
	/**
	 * 选取
	 */
	public void checked() {
		this.checked = true;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isChkDisabled() {
		return chkDisabled;
	}

	public void setChkDisabled(boolean chkDisabled) {
		this.chkDisabled = chkDisabled;
	}
}
