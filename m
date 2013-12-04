Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 196FC5299D
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 07:06:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB475x1J011428
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 01:05:59 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB475xs4019242
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 01:05:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 01:05:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB475wIs027361;
	Wed, 4 Dec 2013 01:05:59 -0600
Date: Wed, 4 Dec 2013 02:05:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yaniv Mahani <yanivma@ti.com>
Message-ID: <20131204070558.GV690@edge>
References: <1385638346-11618-1-git-send-email-yanivma@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385638346-11618-1-git-send-email-yanivma@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 01/14] wpa-supplicant-wl18xx: Update recipe to ol_r8.a8.08 version.
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Dec 2013 07:06:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, while I was reviewing your patches, I was thinking about some general 
comments and recommendations for the entire patchset...

There should have been 8 patches, not 14 - since in 6 instances you are 
updating the recipe by copying it from the old version and removing it in the 
next patch. So, those 6 removal patches are rather wasteful. Instead of doing 
copy->patch->remove, you should do rename->patch. The changes in the patch 
will be pretty much the same, but you won't need separate patches for removing 
old versions.

Anyway, it should be easy to fix from a tree where you have these 14 patches 
commited at the end (or just applied):

$ git rebase -i HEAD~14

* in the provided list of commits, replace "pick" with "squash" for those 
lines where you remove old versions (6 of those), save and exit

* git-rebase will then open an editor with combined commit messages for each 
squashed commit - edit by simply dropping the second part

* by the end of rebase, you should have 8 commits, which you can convert into 
emailable patches:

$ git format-patch -M -8

* the -M option above tells git to detect renames (similar to -C for copies)

* send the above 8 patches back to the list with a single git-send-email 
command with --no-chain-reply-to option, if you don't have it in .gitconfig

$ git send-email --to="meta-arago@arago-project.org" --no-chain-reply-to *.patch

That should make your patches more manageable, as there will be less of them 
and they will stay in a single thread, instead of 14 of them now...

Please see below for comments on this particular patch.


On Thu, Nov 28, 2013 at 01:32:26PM +0200, Yaniv Mahani wrote:
> From: Yaniv Machani <yanivma@ti.com>
> 
> - Build wpa-supplicant from TI_Openlink ol_r8.a8.08
> - Add missing includes for building with libnl3.
> - Adjusted configuration files, and added p2p conf.
> 
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> ---
>  .../wpa-supplicant/wpa-supplicant-wl18xx/defconfig |  164 ++++--
>  ....a6.01.bb => wpa-supplicant-wl18xx_r8.a8.08.bb} |    6 +-
>  .../wpa-supplicant/wpa-supplicant.inc              |    3 +
>  .../wpa-supplicant/p2p_supplicant.conf             |   14 +
>  .../wpa-supplicant/wpa_supplicant.conf             |  674 +-------------------
>  5 files changed, 164 insertions(+), 697 deletions(-)
>  copy meta-arago-extras/recipes-connectivity/wpa-supplicant/{wpa-supplicant-wl18xx_r8.a6.01.bb => wpa-supplicant-wl18xx_r8.a8.08.bb} (89%)
>  create mode 100755 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf

[snip defconfig, as I trust you know what you are doing...]


> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
> similarity index 89%
> copy from meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
> copy to meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
> index f6c4f70..d9a9fde 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a6.01.bb
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx_r8.a8.08.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
>  
>  FILESEXTRAPATHS_append := "${THISDIR}/wpa-supplicant:"
>  
> -# Tag: ol_r8.a6.01
> -SRCREV = "7190ff7dbd43243290b626068ded0d61c5019050"
> -PR = "r2+gitr${SRCPV}"
> +# Tag: ol_r8.a8.08
> +SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
> +PR = "r0+gitr${SRCPV}"

Well, it wasn't correct in the original version of the recipe, but it includes 
the coomon wpa-supplicant.inc file which already sets PR. Other wpa-supplicant 
recipes for WiLink6 use PR_append here, so WiLink8 recipe should too.


>  # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
>  PV = "2.0-devel-ti"
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> index 2d8970f..ef40a83 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc

Please note - this is a common file for WiLink6 and WiLink8 recipes. Are you 
sure the changes below won't break older versions?


> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
>             file://defaults-sane \
>             file://wpa-supplicant.sh \
>             file://wpa_supplicant.conf \
> +           file://p2p_supplicant.conf \
>             file://wpa_supplicant.conf-sane \
>             file://99_wpa_supplicant \
>             file://wpa_supplicant.conf \
> @@ -55,6 +56,7 @@ do_install () {
>  	install -d ${D}${sysconfdir}/default
>  	install -m 600 ${WORKDIR}/defaults-sane ${D}${sysconfdir}/default/wpa
>  	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
> +        install -m 600 ${WORKDIR}/p2p_supplicant.conf ${D}${sysconfdir}/p2p_supplicant.conf

Bad indentation - above lines use tabs and you add 8-space line.

>  
>  	if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config || grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
>  		install -d ${D}/${sysconfdir}/dbus-1/system.d
> @@ -104,6 +106,7 @@ pkg_postinst_wpa-supplicant () {
>  do_configure () {
>  	install -m 0755 ${WORKDIR}/defconfig .config
>  	echo "CFLAGS += -I${STAGING_INCDIR}" >> .config
> +        echo "CFLAGS += -I${STAGING_INCDIR}/libnl3/" >> .config

Same indentation problem here.


>  	echo "LIBS += -L${STAGING_LIBDIR}" >> .config
>  	echo "LIBS_p += -L${STAGING_LIBDIR}" >> .config
>  	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" = "1" ]; then
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
> new file mode 100755
> index 0000000..2de8730
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/p2p_supplicant.conf
> @@ -0,0 +1,14 @@
> +ctrl_interface=/var/run/wpa_supplicant
> +update_config=0
> +device_name=TI-SITARA-P2P
> +device_type=1-0050F204-1
> +config_methods=virtual_push_button physical_display keypad
> +p2p_go_intent=0
> +country=US
> +##p2p_pref_chan=115:36 115:40
> +driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
> +p2p_go_max_inactivity=60
> +p2p_go_ht40=1
> +p2p_multi_chan=1
> +disassoc_low_ack=1
> +concurrent_sched_scan=1
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
> index f0c993d..f144a38 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf

Again, wpa_supplicant.conf happens to be a common file shared between WiLink6 
and WiLink8. Maybe it should be split to have separate versions of the config 
for WL6/WL8?


> @@ -1,19 +1,4 @@
> -##### Example wpa_supplicant configuration file ###############################
> -#
> -# This file describes configuration file format and lists all available option.
> -# Please also take a look at simpler configuration examples in 'examples'
> -# subdirectory.
> -#
> -# Empty lines and lines starting with # are ignored
> -
> -# NOTE! This file may contain password information and should probably be made
> -# readable only by root user on multiuser systems.
> -
> -# Note: All file paths in this configuration file should use full (absolute,
> -# not relative to working directory) path in order to allow working directory
> -# to be changed. This can happen if wpa_supplicant is run in the background.
> -
> -# Whether to allow wpa_supplicant to update (overwrite) configuration
> +##### wpa_supplicant configuration file template #####
>  #
>  # This option can be used to allow wpa_supplicant to overwrite configuration
>  # file whenever configuration is changed (e.g., new network block is added with
> @@ -21,59 +6,8 @@
>  # wpa_cli/wpa_gui to be able to store the configuration changes permanently.
>  # Please note that overwriting configuration file will remove the comments from
>  # it.
> -#update_config=1
> -
> -# global configuration (shared by all network blocks)
> -#
> -# Parameters for the control interface. If this is specified, wpa_supplicant
> -# will open a control interface that is available for external programs to
> -# manage wpa_supplicant. The meaning of this string depends on which control
> -# interface mechanism is used. For all cases, the existance of this parameter
> -# in configuration is used to determine whether the control interface is
> -# enabled.
> -#
> -# For UNIX domain sockets (default on Linux and BSD): This is a directory that
> -# will be created for UNIX domain sockets for listening to requests from
> -# external programs (CLI/GUI, etc.) for status information and configuration.
> -# The socket file will be named based on the interface name, so multiple
> -# wpa_supplicant processes can be run at the same time if more than one
> -# interface is used.
> -# /var/run/wpa_supplicant is the recommended directory for sockets and by
> -# default, wpa_cli will use it when trying to connect with wpa_supplicant.
> -#
> -# Access control for the control interface can be configured by setting the
> -# directory to allow only members of a group to use sockets. This way, it is
> -# possible to run wpa_supplicant as root (since it needs to change network
> -# configuration and open raw sockets) and still allow GUI/CLI components to be
> -# run as non-root users. However, since the control interface can be used to
> -# change the network configuration, this access needs to be protected in many
> -# cases. By default, wpa_supplicant is configured to use gid 0 (root). If you
> -# want to allow non-root users to use the control interface, add a new group
> -# and change this value to match with that group. Add users that should have
> -# control interface access to this group. If this variable is commented out or
> -# not included in the configuration file, group will not be changed from the
> -# value it got by default when the directory or socket was created.
> -#
> -# When configuring both the directory and group, use following format:
> -# DIR=/var/run/wpa_supplicant GROUP=wheel
> -# DIR=/var/run/wpa_supplicant GROUP=0
> -# (group can be either group name or gid)
> -#
> -# For UDP connections (default on Windows): The value will be ignored. This
> -# variable is just used to select that the control interface is to be created.
> -# The value can be set to, e.g., udp (ctrl_interface=udp)
> -#
> -# For Windows Named Pipe: This value can be used to set the security descriptor
> -# for controlling access to the control interface. Security descriptor can be
> -# set using Security Descriptor String Format (see http://msdn.microsoft.com/
> -# library/default.asp?url=/library/en-us/secauthz/security/
> -# security_descriptor_string_format.asp). The descriptor string needs to be
> -# prefixed with SDDL=. For example, ctrl_interface=SDDL=D: would set an empty
> -# DACL (which will reject all connections). See README-Windows.txt for more
> -# information about SDDL string format.
> -#
> +update_config=1
>  ctrl_interface=/var/run/wpa_supplicant
> -
>  # IEEE 802.1X/EAPOL version
>  # wpa_supplicant is implemented based on IEEE Std 802.1X-2004 which defines
>  # EAPOL version 2. However, there are many APs that do not handle the new
> @@ -82,14 +16,15 @@ ctrl_interface=/var/run/wpa_supplicant
>  # to 1 by default. This configuration value can be used to set it to the new
>  # version (2).
>  eapol_version=1
> -
>  # AP scanning/selection
>  # By default, wpa_supplicant requests driver to perform AP scanning and then
>  # uses the scan results to select a suitable AP. Another alternative is to
>  # allow the driver to take care of AP scanning and selection and use
>  # wpa_supplicant just to process EAPOL frames based on IEEE 802.11 association
>  # information from the driver.
> -# 1: wpa_supplicant initiates scanning and AP selection
> +# 1: wpa_supplicant initiates scanning and AP selection; if no APs matching to
> +#    the currently enabled networks are found, a new network (IBSS or AP mode
> +#    operation) may be initialized (if configured) (default)
>  # 0: driver takes care of scanning, AP selection, and IEEE 802.11 association
>  #    parameters (e.g., WPA IE generation); this mode can also be used with
>  #    non-WPA drivers when using IEEE 802.1X mode; do not try to associate with
> @@ -102,589 +37,28 @@ eapol_version=1
>  #    the driver reports successful association; each network block should have
>  #    explicit security policy (i.e., only one option in the lists) for
>  #    key_mgmt, pairwise, group, proto variables
> +# When using IBSS or AP mode, ap_scan=2 mode can force the new network to be
> +# created immediately regardless of scan results. ap_scan=1 mode will first try
> +# to scan for existing networks and only if no matches with the enabled
> +# networks are found, a new IBSS or AP mode network is created.
>  ap_scan=1
> -
>  # EAP fast re-authentication
>  # By default, fast re-authentication is enabled for all EAP methods that
>  # support it. This variable can be used to disable fast re-authentication.
>  # Normally, there is no need to disable this.
>  fast_reauth=1
> -
> -# OpenSSL Engine support
> -# These options can be used to load OpenSSL engines.
> -# The two engines that are supported currently are shown below:
> -# They are both from the opensc project (http://www.opensc.org/)
> -# By default no engines are loaded.
> -# make the opensc engine available
> -#opensc_engine_path=/usr/lib/opensc/engine_opensc.so
> -# make the pkcs11 engine available
> -#pkcs11_engine_path=/usr/lib/opensc/engine_pkcs11.so
> -# configure the path to the pkcs11 module required by the pkcs11 engine
> -#pkcs11_module_path=/usr/lib/pkcs11/opensc-pkcs11.so
> -
> -# Dynamic EAP methods
> -# If EAP methods were built dynamically as shared object files, they need to be
> -# loaded here before being used in the network blocks. By default, EAP methods
> -# are included statically in the build, so these lines are not needed
> -#load_dynamic_eap=/usr/lib/wpa_supplicant/eap_tls.so
> -#load_dynamic_eap=/usr/lib/wpa_supplicant/eap_md5.so
> -
> -# Driver interface parameters
> -# This field can be used to configure arbitrary driver interace parameters. The
> -# format is specific to the selected driver interface. This field is not used
> -# in most cases.
> -#driver_param="field=value"
> -
> -# Maximum lifetime for PMKSA in seconds; default 43200
> -#dot11RSNAConfigPMKLifetime=43200
> -# Threshold for reauthentication (percentage of PMK lifetime); default 70
> -#dot11RSNAConfigPMKReauthThreshold=70
> -# Timeout for security association negotiation in seconds; default 60
> -#dot11RSNAConfigSATimeout=60
> -
> -# network block
> -#
> -# Each network (usually AP's sharing the same SSID) is configured as a separate
> -# block in this configuration file. The network blocks are in preference order
> -# (the first match is used).
> -#
> -# network block fields:
> -#
> -# disabled:
> -#	0 = this network can be used (default)
> -#	1 = this network block is disabled (can be enabled through ctrl_iface,
> -#	    e.g., with wpa_cli or wpa_gui)
> -#
> -# id_str: Network identifier string for external scripts. This value is passed
> -#	to external action script through wpa_cli as WPA_ID_STR environment
> -#	variable to make it easier to do network specific configuration.
> -#
> -# ssid: SSID (mandatory); either as an ASCII string with double quotation or
> -#	as hex string; network name
> -#
> -# scan_ssid:
> -#	0 = do not scan this SSID with specific Probe Request frames (default)
> -#	1 = scan with SSID-specific Probe Request frames (this can be used to
> -#	    find APs that do not accept broadcast SSID or use multiple SSIDs;
> -#	    this will add latency to scanning, so enable this only when needed)
> -#
> -# bssid: BSSID (optional); if set, this network block is used only when
> -#	associating with the AP using the configured BSSID
> -#
> -# priority: priority group (integer)
> -# By default, all networks will get same priority group (0). If some of the
> -# networks are more desirable, this field can be used to change the order in
> -# which wpa_supplicant goes through the networks when selecting a BSS. The
> -# priority groups will be iterated in decreasing priority (i.e., the larger the
> -# priority value, the sooner the network is matched against the scan results).
> -# Within each priority group, networks will be selected based on security
> -# policy, signal strength, etc.
> -# Please note that AP scanning with scan_ssid=1 and ap_scan=2 mode are not
> -# using this priority to select the order for scanning. Instead, they try the
> -# networks in the order that used in the configuration file.
> -#
> -# mode: IEEE 802.11 operation mode
> -# 0 = infrastructure (Managed) mode, i.e., associate with an AP (default)
> -# 1 = IBSS (ad-hoc, peer-to-peer)
> -# Note: IBSS can only be used with key_mgmt NONE (plaintext and static WEP)
> -# and key_mgmt=WPA-NONE (fixed group key TKIP/CCMP). In addition, ap_scan has
> -# to be set to 2 for IBSS. WPA-None requires following network block options:
> -# proto=WPA, key_mgmt=WPA-NONE, pairwise=NONE, group=TKIP (or CCMP, but not
> -# both), and psk must also be set.
> -#
> -# proto: list of accepted protocols
> -# WPA = WPA/IEEE 802.11i/D3.0
> -# RSN = WPA2/IEEE 802.11i (also WPA2 can be used as an alias for RSN)
> -# If not set, this defaults to: WPA RSN
> -#
> -# key_mgmt: list of accepted authenticated key management protocols
> -# WPA-PSK = WPA pre-shared key (this requires 'psk' field)
> -# WPA-EAP = WPA using EAP authentication (this can use an external
> -#	program, e.g., Xsupplicant, for IEEE 802.1X EAP Authentication
> -# IEEE8021X = IEEE 802.1X using EAP authentication and (optionally) dynamically
> -#	generated WEP keys
> -# NONE = WPA is not used; plaintext or static WEP could be used
> -# If not set, this defaults to: WPA-PSK WPA-EAP
> -#
> -# auth_alg: list of allowed IEEE 802.11 authentication algorithms
> -# OPEN = Open System authentication (required for WPA/WPA2)
> -# SHARED = Shared Key authentication (requires static WEP keys)
> -# LEAP = LEAP/Network EAP (only used with LEAP)
> -# If not set, automatic selection is used (Open System with LEAP enabled if
> -# LEAP is allowed as one of the EAP methods).
> -#
> -# pairwise: list of accepted pairwise (unicast) ciphers for WPA
> -# CCMP = AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0]
> -# TKIP = Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
> -# NONE = Use only Group Keys (deprecated, should not be included if APs support
> -#	pairwise keys)
> -# If not set, this defaults to: CCMP TKIP
> -#
> -# group: list of accepted group (broadcast/multicast) ciphers for WPA
> -# CCMP = AES in Counter mode with CBC-MAC [RFC 3610, IEEE 802.11i/D7.0]
> -# TKIP = Temporal Key Integrity Protocol [IEEE 802.11i/D7.0]
> -# WEP104 = WEP (Wired Equivalent Privacy) with 104-bit key
> -# WEP40 = WEP (Wired Equivalent Privacy) with 40-bit key [IEEE 802.11]
> -# If not set, this defaults to: CCMP TKIP WEP104 WEP40
> -#
> -# psk: WPA preshared key; 256-bit pre-shared key
> -# The key used in WPA-PSK mode can be entered either as 64 hex-digits, i.e.,
> -# 32 bytes or as an ASCII passphrase (in which case, the real PSK will be
> -# generated using the passphrase and SSID). ASCII passphrase must be between
> -# 8 and 63 characters (inclusive).
> -# This field is not needed, if WPA-EAP is used.
> -# Note: Separate tool, wpa_passphrase, can be used to generate 256-bit keys
> -# from ASCII passphrase. This process uses lot of CPU and wpa_supplicant
> -# startup and reconfiguration time can be optimized by generating the PSK only
> -# only when the passphrase or SSID has actually changed.
> -#
> -# eapol_flags: IEEE 802.1X/EAPOL options (bit field)
> -# Dynamic WEP key required for non-WPA mode
> -# bit0 (1): require dynamically generated unicast WEP key
> -# bit1 (2): require dynamically generated broadcast WEP key
> -# 	(3 = require both keys; default)
> -# Note: When using wired authentication, eapol_flags must be set to 0 for the
> -# authentication to be completed successfully.
> -#
> -# proactive_key_caching:
> -# Enable/disable opportunistic PMKSA caching for WPA2.
> -# 0 = disabled (default)
> -# 1 = enabled
> -#
> -# wep_key0..3: Static WEP key (ASCII in double quotation, e.g. "abcde" or
> -# hex without quotation, e.g., 0102030405)
> -# wep_tx_keyidx: Default WEP key index (TX) (0..3)
> -#
> -# peerkey: Whether PeerKey negotiation for direct links (IEEE 802.11e DLS) is
> -# allowed. This is only used with RSN/WPA2.
> -# 0 = disabled (default)
> -# 1 = enabled
> -#peerkey=1
> -#
> -# Following fields are only used with internal EAP implementation.
> -# eap: space-separated list of accepted EAP methods
> -#	MD5 = EAP-MD5 (unsecure and does not generate keying material ->
> -#			cannot be used with WPA; to be used as a Phase 2 method
> -#			with EAP-PEAP or EAP-TTLS)
> -#       MSCHAPV2 = EAP-MSCHAPv2 (cannot be used separately with WPA; to be used
> -#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> -#       OTP = EAP-OTP (cannot be used separately with WPA; to be used
> -#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> -#       GTC = EAP-GTC (cannot be used separately with WPA; to be used
> -#		as a Phase 2 method with EAP-PEAP or EAP-TTLS)
> -#	TLS = EAP-TLS (client and server certificate)
> -#	PEAP = EAP-PEAP (with tunnelled EAP authentication)
> -#	TTLS = EAP-TTLS (with tunnelled EAP or PAP/CHAP/MSCHAP/MSCHAPV2
> -#			 authentication)
> -#	If not set, all compiled in methods are allowed.
> -#
> -# identity: Identity string for EAP
> -# anonymous_identity: Anonymous identity string for EAP (to be used as the
> -#	unencrypted identity with EAP types that support different tunnelled
> -#	identity, e.g., EAP-TTLS)
> -# password: Password string for EAP
> -# ca_cert: File path to CA certificate file (PEM/DER). This file can have one
> -#	or more trusted CA certificates. If ca_cert and ca_path are not
> -#	included, server certificate will not be verified. This is insecure and
> -#	a trusted CA certificate should always be configured when using
> -#	EAP-TLS/TTLS/PEAP. Full path should be used since working directory may
> -#	change when wpa_supplicant is run in the background.
> -#	On Windows, trusted CA certificates can be loaded from the system
> -#	certificate store by setting this to cert_store://<name>, e.g.,
> -#	ca_cert="cert_store://CA" or ca_cert="cert_store://ROOT".
> -#	Note that when running wpa_supplicant as an application, the user
> -#	certificate store (My user account) is used, whereas computer store
> -#	(Computer account) is used when running wpasvc as a service.
> -# ca_path: Directory path for CA certificate files (PEM). This path may
> -#	contain multiple CA certificates in OpenSSL format. Common use for this
> -#	is to point to system trusted CA list which is often installed into
> -#	directory like /etc/ssl/certs. If configured, these certificates are
> -#	added to the list of trusted CAs. ca_cert may also be included in that
> -#	case, but it is not required.
> -# client_cert: File path to client certificate file (PEM/DER)
> -#	Full path should be used since working directory may change when
> -#	wpa_supplicant is run in the background.
> -#	Alternatively, a named configuration blob can be used by setting this
> -#	to blob://<blob name>.
> -# private_key: File path to client private key file (PEM/DER/PFX)
> -#	When PKCS#12/PFX file (.p12/.pfx) is used, client_cert should be
> -#	commented out. Both the private key and certificate will be read from
> -#	the PKCS#12 file in this case. Full path should be used since working
> -#	directory may change when wpa_supplicant is run in the background.
> -#	Windows certificate store can be used by leaving client_cert out and
> -#	configuring private_key in one of the following formats:
> -#	cert://substring_to_match
> -#	hash://certificate_thumbprint_in_hex
> -#	for example: private_key="hash://63093aa9c47f56ae88334c7b65a4"
> -#	Note that when running wpa_supplicant as an application, the user
> -#	certificate store (My user account) is used, whereas computer store
> -#	(Computer account) is used when running wpasvc as a service.
> -#	Alternatively, a named configuration blob can be used by setting this
> -#	to blob://<blob name>.
> -# private_key_passwd: Password for private key file (if left out, this will be
> -#	asked through control interface)
> -# dh_file: File path to DH/DSA parameters file (in PEM format)
> -#	This is an optional configuration file for setting parameters for an
> -#	ephemeral DH key exchange. In most cases, the default RSA
> -#	authentication does not use this configuration. However, it is possible
> -#	setup RSA to use ephemeral DH key exchange. In addition, ciphers with
> -#	DSA keys always use ephemeral DH keys. This can be used to achieve
> -#	forward secrecy. If the file is in DSA parameters format, it will be
> -#	automatically converted into DH params.
> -# subject_match: Substring to be matched against the subject of the
> -#	authentication server certificate. If this string is set, the server
> -#	sertificate is only accepted if it contains this string in the subject.
> -#	The subject string is in following format:
> -#	/C=US/ST=CA/L=San Francisco/CN=Test AS/emailAddress=as@example.com
> -# altsubject_match: Semicolon separated string of entries to be matched against
> -#	the alternative subject name of the authentication server certificate.
> -#	If this string is set, the server sertificate is only accepted if it
> -#	contains one of the entries in an alternative subject name extension.
> -#	altSubjectName string is in following format: TYPE:VALUE
> -#	Example: EMAIL:server@example.com
> -#	Example: DNS:server.example.com;DNS:server2.example.com
> -#	Following types are supported: EMAIL, DNS, URI
> -# phase1: Phase1 (outer authentication, i.e., TLS tunnel) parameters
> -#	(string with field-value pairs, e.g., "peapver=0" or
> -#	"peapver=1 peaplabel=1")
> -#	'peapver' can be used to force which PEAP version (0 or 1) is used.
> -#	'peaplabel=1' can be used to force new label, "client PEAP encryption",
> -#	to be used during key derivation when PEAPv1 or newer. Most existing
> -#	PEAPv1 implementation seem to be using the old label, "client EAP
> -#	encryption", and wpa_supplicant is now using that as the default value.
> -#	Some servers, e.g., Radiator, may require peaplabel=1 configuration to
> -#	interoperate with PEAPv1; see eap_testing.txt for more details.
> -#	'peap_outer_success=0' can be used to terminate PEAP authentication on
> -#	tunneled EAP-Success. This is required with some RADIUS servers that
> -#	implement draft-josefsson-pppext-eap-tls-eap-05.txt (e.g.,
> -#	Lucent NavisRadius v4.4.0 with PEAP in "IETF Draft 5" mode)
> -#	include_tls_length=1 can be used to force wpa_supplicant to include
> -#	TLS Message Length field in all TLS messages even if they are not
> -#	fragmented.
> -#	sim_min_num_chal=3 can be used to configure EAP-SIM to require three
> -#	challenges (by default, it accepts 2 or 3)
> -# phase2: Phase2 (inner authentication with TLS tunnel) parameters
> -#	(string with field-value pairs, e.g., "auth=MSCHAPV2" for EAP-PEAP or
> -#	"autheap=MSCHAPV2 autheap=MD5" for EAP-TTLS)
> -# Following certificate/private key fields are used in inner Phase2
> -# authentication when using EAP-TTLS or EAP-PEAP.
> -# ca_cert2: File path to CA certificate file. This file can have one or more
> -#	trusted CA certificates. If ca_cert2 and ca_path2 are not included,
> -#	server certificate will not be verified. This is insecure and a trusted
> -#	CA certificate should always be configured.
> -# ca_path2: Directory path for CA certificate files (PEM)
> -# client_cert2: File path to client certificate file
> -# private_key2: File path to client private key file
> -# private_key2_passwd: Password for private key file
> -# dh_file2: File path to DH/DSA parameters file (in PEM format)
> -# subject_match2: Substring to be matched against the subject of the
> -#	authentication server certificate.
> -# altsubject_match2: Substring to be matched against the alternative subject
> -#	name of the authentication server certificate.
> -#
> -# fragment_size: Maximum EAP fragment size in bytes (default 1398).
> -#	This value limits the fragment size for EAP methods that support
> -#	fragmentation (e.g., EAP-TLS and EAP-PEAP). This value should be set
> -#	small enough to make the EAP messages fit in MTU of the network
> -#	interface used for EAPOL. The default value is suitable for most
> -#	cases.
> -#
> -# EAP-PSK variables:
> -# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
> -# nai: user NAI
> -#
> -# EAP-PAX variables:
> -# eappsk: 16-byte (128-bit, 32 hex digits) pre-shared key in hex format
> -#
> -# EAP-SAKE variables:
> -# eappsk: 32-byte (256-bit, 64 hex digits) pre-shared key in hex format
> -#	(this is concatenation of Root-Secret-A and Root-Secret-B)
> -# nai: user NAI (PEERID)
> -#
> -# EAP-GPSK variables:
> -# eappsk: Pre-shared key in hex format (at least 128 bits, i.e., 32 hex digits)
> -# nai: user NAI (ID_Client)
> -#
> -# EAP-FAST variables:
> -# pac_file: File path for the PAC entries. wpa_supplicant will need to be able
> -#	to create this file and write updates to it when PAC is being
> -#	provisioned or refreshed. Full path to the file should be used since
> -#	working directory may change when wpa_supplicant is run in the
> -#	background. Alternatively, a named configuration blob can be used by
> -#	setting this to blob://<blob name>
> -# phase1: fast_provisioning=1 option enables in-line provisioning of EAP-FAST
> -#	credentials (PAC)
> -#
> -# wpa_supplicant supports number of "EAP workarounds" to work around
> -# interoperability issues with incorrectly behaving authentication servers.
> -# These are enabled by default because some of the issues are present in large
> -# number of authentication servers. Strict EAP conformance mode can be
> -# configured by disabling workarounds with eap_workaround=0.
> -
> -# Example blocks:
> -
> -# Simple case: WPA-PSK, PSK as an ASCII passphrase, allow all valid ciphers
> -network={
> -	ssid="simple"
> -	psk="very secret passphrase"
> -	priority=5
> -}
> -
> -# Same as previous, but request SSID-specific scanning (for APs that reject
> -# broadcast SSID)
> -network={
> -	ssid="second ssid"
> -	scan_ssid=1
> -	psk="very secret passphrase"
> -	priority=2
> -}
> -
> -# Only WPA-PSK is used. Any valid cipher combination is accepted.
> -network={
> -	ssid="example"
> -	proto=WPA
> -	key_mgmt=WPA-PSK
> -	pairwise=CCMP TKIP
> -	group=CCMP TKIP WEP104 WEP40
> -	psk=06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
> -	priority=2
> -}
> -
> -# Only WPA-EAP is used. Both CCMP and TKIP is accepted. An AP that used WEP104
> -# or WEP40 as the group cipher will not be accepted.
> -network={
> -	ssid="example"
> -	proto=RSN
> -	key_mgmt=WPA-EAP
> -	pairwise=CCMP TKIP
> -	group=CCMP TKIP
> -	eap=TLS
> -	identity="user@example.com"
> -	ca_cert="/etc/cert/ca.pem"
> -	client_cert="/etc/cert/user.pem"
> -	private_key="/etc/cert/user.prv"
> -	private_key_passwd="password"
> -	priority=1
> -}
> -
> -# EAP-PEAP/MSCHAPv2 configuration for RADIUS servers that use the new peaplabel
> -# (e.g., Radiator)
> -network={
> -	ssid="example"
> -	key_mgmt=WPA-EAP
> -	eap=PEAP
> -	identity="user@example.com"
> -	password="foobar"
> -	ca_cert="/etc/cert/ca.pem"
> -	phase1="peaplabel=1"
> -	phase2="auth=MSCHAPV2"
> -	priority=10
> -}
> -
> -# EAP-TTLS/EAP-MD5-Challenge configuration with anonymous identity for the
> -# unencrypted use. Real identity is sent only within an encrypted TLS tunnel.
> -network={
> -	ssid="example"
> -	key_mgmt=WPA-EAP
> -	eap=TTLS
> -	identity="user@example.com"
> -	anonymous_identity="anonymous@example.com"
> -	password="foobar"
> -	ca_cert="/etc/cert/ca.pem"
> -	priority=2
> -}
> -
> -# EAP-TTLS/MSCHAPv2 configuration with anonymous identity for the unencrypted
> -# use. Real identity is sent only within an encrypted TLS tunnel.
> -network={
> -	ssid="example"
> -	key_mgmt=WPA-EAP
> -	eap=TTLS
> -	identity="user@example.com"
> -	anonymous_identity="anonymous@example.com"
> -	password="foobar"
> -	ca_cert="/etc/cert/ca.pem"
> -	phase2="auth=MSCHAPV2"
> -}
> -
> -# WPA-EAP, EAP-TTLS with different CA certificate used for outer and inner
> -# authentication.
> -network={
> -	ssid="example"
> -	key_mgmt=WPA-EAP
> -	eap=TTLS
> -	# Phase1 / outer authentication
> -	anonymous_identity="anonymous@example.com"
> -	ca_cert="/etc/cert/ca.pem"
> -	# Phase 2 / inner authentication
> -	phase2="autheap=TLS"
> -	ca_cert2="/etc/cert/ca2.pem"
> -	client_cert2="/etc/cer/user.pem"
> -	private_key2="/etc/cer/user.prv"
> -	private_key2_passwd="password"
> -	priority=2
> -}
> -
> -# Both WPA-PSK and WPA-EAP is accepted. Only CCMP is accepted as pairwise and
> -# group cipher.
> -network={
> -	ssid="example"
> -	bssid=00:11:22:33:44:55
> -	proto=WPA RSN
> -	key_mgmt=WPA-PSK WPA-EAP
> -	pairwise=CCMP
> -	group=CCMP
> -	psk=06b4be19da289f475aa46a33cb793029d4ab3db7a23ee92382eb0106c72ac7bb
> -}
> -
> -# Special characters in SSID, so use hex string. Default to WPA-PSK, WPA-EAP
> -# and all valid ciphers.
> -network={
> -	ssid=00010203
> -	psk=000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
> -}
> -
> -
> -# IEEE 802.1X/EAPOL with dynamically generated WEP keys (i.e., no WPA) using
> -# EAP-TLS for authentication and key generation; require both unicast and
> -# broadcast WEP keys.
> -network={
> -	ssid="1x-test"
> -	key_mgmt=IEEE8021X
> -	eap=TLS
> -	identity="user@example.com"
> -	ca_cert="/etc/cert/ca.pem"
> -	client_cert="/etc/cert/user.pem"
> -	private_key="/etc/cert/user.prv"
> -	private_key_passwd="password"
> -	eapol_flags=3
> -}
> -
> -
> -# LEAP with dynamic WEP keys
> -network={
> -	ssid="leap-example"
> -	key_mgmt=IEEE8021X
> -	eap=LEAP
> -	identity="user"
> -	password="foobar"
> -}
> -
> -# Plaintext connection (no WPA, no IEEE 802.1X)
> -network={
> -	ssid="plaintext-test"
> -	key_mgmt=NONE
> -}
> -
> -
> -# Shared WEP key connection (no WPA, no IEEE 802.1X)
> -network={
> -	ssid="static-wep-test"
> -	key_mgmt=NONE
> -	wep_key0="abcde"
> -	wep_key1=0102030405
> -	wep_key2="1234567890123"
> -	wep_tx_keyidx=0
> -	priority=5
> -}
> -
> -
> -# Shared WEP key connection (no WPA, no IEEE 802.1X) using Shared Key
> -# IEEE 802.11 authentication
> -network={
> -	ssid="static-wep-test2"
> -	key_mgmt=NONE
> -	wep_key0="abcde"
> -	wep_key1=0102030405
> -	wep_key2="1234567890123"
> -	wep_tx_keyidx=0
> -	priority=5
> -	auth_alg=SHARED
> -}
> -
> -
> -# IBSS/ad-hoc network with WPA-None/TKIP.
> -network={
> -	ssid="test adhoc"
> -	mode=1
> -	proto=WPA
> -	key_mgmt=WPA-NONE
> -	pairwise=NONE
> -	group=TKIP
> -	psk="secret passphrase"
> -}
> -
> -
> -# Catch all example that allows more or less all configuration modes
> -network={
> -	ssid="example"
> -	scan_ssid=1
> -	key_mgmt=WPA-EAP WPA-PSK IEEE8021X NONE
> -	pairwise=CCMP TKIP
> -	group=CCMP TKIP WEP104 WEP40
> -	psk="very secret passphrase"
> -	eap=TTLS PEAP TLS
> -	identity="user@example.com"
> -	password="foobar"
> -	ca_cert="/etc/cert/ca.pem"
> -	client_cert="/etc/cert/user.pem"
> -	private_key="/etc/cert/user.prv"
> -	private_key_passwd="password"
> -	phase1="peaplabel=0"
> -}
> -
> -# Example of EAP-TLS with smartcard (openssl engine)
> -network={
> -	ssid="example"
> -	key_mgmt=WPA-EAP
> -	eap=TLS
> -	proto=RSN
> -	pairwise=CCMP TKIP
> -	group=CCMP TKIP
> -	identity="user@example.com"
> -	ca_cert="/etc/cert/ca.pem"
> -	client_cert="/etc/cert/user.pem"
> -
> -	engine=1
> -
> -	# The engine configured here must be available. Look at
> -	# OpenSSL engine support in the global section.
> -	# The key available through the engine must be the private key
> -	# matching the client certificate configured above.
> -
> -	# use the opensc engine
> -	#engine_id="opensc"
> -	#key_id="45"
> -
> -	# use the pkcs11 engine
> -	engine_id="pkcs11"
> -	key_id="id_45"
> -
> -	# Optional PIN configuration; this can be left out and PIN will be
> -	# asked through the control interface
> -	pin="1234"
> -}
> -
> -# Example configuration showing how to use an inlined blob as a CA certificate
> -# data instead of using external file
> -network={
> -	ssid="example"
> -	key_mgmt=WPA-EAP
> -	eap=TTLS
> -	identity="user@example.com"
> -	anonymous_identity="anonymous@example.com"
> -	password="foobar"
> -	ca_cert="blob://exampleblob"
> -	priority=20
> -}
> -
> -blob-base64-exampleblob={
> -SGVsbG8gV29ybGQhCg==
> -}
> -
> -
> -# Wildcard match for SSID (plaintext APs only). This example select any
> -# open AP regardless of its SSID.
> -network={
> -	key_mgmt=NONE
> -}
> +device_name=Blaze
> +manufacturer=TI
> +model_name=Wilink
> +model_number=wl18xx
> +serial_number=12345
> +driver_param=use_multi_chan_concurrent=1 use_p2p_group_interface=1
> +# Timeout in seconds to detect STA inactivity (default: 300 seconds)
> +#
> +# This timeout value is used in P2P GO mode to clean up
> +# inactive stations.
> +p2p_go_max_inactivity=60
> +p2p_go_ht40=1
> +p2p_multi_chan=1
> +disassoc_low_ack=1
> +concurrent_sched_scan=1
> -- 
> 1.7.9
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

