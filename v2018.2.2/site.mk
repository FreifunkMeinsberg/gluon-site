GLUON_FEATURES := \
authorized-keys \
        mesh-batman-adv-15 \
        alfred \
        respondd \
        autoupdater \
        authorized-keys \
        config-mode-autoupdater \
        config-mode-contact-info \
        config-mode-core \
        config-mode-geo-location-osm \
        config-mode-hostname \
        config-mode-mesh-vpn \
        ebtables-filter-multicast \
        ebtables-filter-ra-dhcp \
        ebtables-source-filter \
        web-admin \
        web-autoupdater \
        web-wifi-config \
        web-network \
        mesh-vpn-fastd \
        status-page-mesh-batman-adv \
        radvd \
        setup-mode \
        status-page \
	web-advanced \
	web-wizard \
	web-node-role \
        web-osm

GLUON_SITE_PACKAGES := \
	iwinfo \
	haveged


USB_BASIC := \
        kmod-usb-core \
        kmod-usb2 \
        kmod-usb-hid

USB_NIC := \
        kmod-usb-net \
        kmod-usb-net-asix \
        kmod-usb-net-rtl8150 \
        kmod-usb-net-rtl8152 \
        kmod-usb-net-dm9601-ether

USB_WIFI := \
        kmod-rtl8192cu


# additional packages
TOOLS_PACKAGES := \
        iperf \
        socat \
        tcpdump \
        vnstat \
        vnstati



FLASH_4MB := false 
ifeq ($(GLUON_TARGET),ar71xx-tiny)
       FLASH_4MB := true 
endif

ifeq ($(GLUON_TARGET),ramips-rt305x)
       FLASH_4MB := true 
endif

ifeq ($(FLASH_4MB),false) 

GLUON_SITE_PACKAGES += \
	pciutils \
	comgt \
	ppp \
	kmod-fs-ext4 \
	kmod-nls-utf8 \
	kmod-usb2 \
	kmod-usb-hid \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-cdc-ether \
	kmod-usb-net-rtl8152 \
	kmod-usb-serial \
	kmod-usb-serial-option \
	kmod-usb-serial-wwan \
	kmod-usb-storage \
    	respondd-module-airtime \
	usbutils 
endif


ifeq ($(GLUON_TARGET),x86-generic)
        GLUON_SITE_PACKAGES += \
                $(USB_BASIC) \
                $(TOOLS_PACKAGES) \
                kmod-usb-ohci-pci \
                $(USB_NIC)
endif

ifeq ($(GLUON_TARGET),x86-64)
        GLUON_SITE_PACKAGES += \
                $(TOOLS_PACKAGES) \
                $(USB_BASIC) \
                $(USB_NIC) \
 kmod-phy-broadcom \
        qemu-ga \
                kmod-igb #APU2
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2708)
        GLUON_SITE_PACKAGES += \
                $(TOOLS_PACKAGES) \
                $(USB_BASIC) \
                $(USB_NIC) \
                $(USB_WIFI)
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2709)
        GLUON_SITE_PACKAGES += \
                $(TOOLS_PACKAGES) \
               $(USB_BASIC) \
                $(USB_NIC) \
                $(USB_WIFI)
endif


ifeq ($(GLUON_TARGET),brcm2708-bcm2710)
        GLUON_SITE_PACKAGES += \
                $(TOOLS_PACKAGES) \
               $(USB_BASIC) \
                $(USB_NIC) \
                $(USB_WIFI)
endif


ifeq ($(GLUON_TARGET),x86-64) 

GLUON_SITE_PACKAGES += \
  kmod-phy-broadcom \
	qemu-ga 
endif



DEFAULT_GLUON_RELEASE := b$(shell date '+%Y%m%d')
DEFAULT_GLUON_CHECKOUT := v2018.2.1 
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)
GLUON_CHECKOUT ?= $(DEFAULT_GLUON_CHECKOUT)
GLUON_PRIORITY ?= 3 
GLUON_LANGS ?= de 
GLUON_REGION ?= eu 
GLUON_WLAN_MESH ?= 11s
