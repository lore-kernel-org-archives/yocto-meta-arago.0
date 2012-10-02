Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 58C63529A4
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2012 00:42:31 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so5858022obb.38
	for <meta-arago@arago-project.org>;
	Mon, 01 Oct 2012 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UtYWtbnUYMtKOO0rcS1SgmWEgJkgJ2iwZtN33JoCqJw=;
	b=BaO8T1NvVFQEcJiouZR+LtPOjdf8rJOikYWQ/V+BfbCjv7uAGYJTtG9aTBs1aAuXWn
	amEJLIHbGBhJlXu5ZCV5SjiCePdnxGsZqpihy/3qdwKct6QKNxtFK/QIPDVzVDFKWdlL
	bQB0XHGHHHxu0LY6tSv7J3xQZ8bB2viHp+SijpMKG3Q/M3+UQqA8H2ierXneK7M3U6ZG
	iyTrJj26XCbll3bkk/AJxDZ8epYkmNVDhGRLZL8hnlUDCKQIR9YVdK1fxCkYE8IsJ0YT
	InGA5Tsv+fkP3FJJIk2LAp8mEZwvCyhyH9LHEkWc4Cbd8j45UCwMzl+81PcLTAKSmjxb
	F9+Q==
Received: by 10.182.157.44 with SMTP id wj12mr12983673obb.41.1349138550798;
	Mon, 01 Oct 2012 17:42:30 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b5sm17708408obd.18.2012.10.01.17.42.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 17:42:30 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon,  1 Oct 2012 20:09:39 -0500
Message-Id: <1349140179-7862-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] matrix-gui-ethernet-demos: Add Matrix ethernet demos
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
X-List-Received-Date: Tue, 02 Oct 2012 00:42:31 -0000

* Port Matrix ethernet demos from Arago to meta-arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../matrix-gui-ethernet-demos/udhcpd_eth1.conf     |  128 ++++++++++++++++++++
 .../matrix/matrix-gui-ethernet-demos_2.0.bb        |   30 +++++
 2 files changed, 158 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos/udhcpd_eth1.conf
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos/udhcpd_eth1.conf b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos/udhcpd_eth1.conf
new file mode 100644
index 0000000..f394fa8
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos/udhcpd_eth1.conf
@@ -0,0 +1,128 @@
+# udhcp_eth1.conf
+#
+# configuration for eth1 interface
+#
+# Copyright (C) {2012} Texas Instruments Incorporated - http://www.ti.com/
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation version 2.
+#
+# This program is distributed "as is" WITHOUT ANY WARRANTY of any
+# kind, whether express or implied; without even the implied warranty
+# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+# Values shown are defaults
+
+# The start and end of the IP lease block
+start		192.168.30.20
+end		192.168.30.254
+
+# The interface that udhcpd will use
+interface	eth1
+
+# The maximum number of leases (includes addresses reserved
+# by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
+# if it's bigger than IP lease block, but it ok to make it
+# smaller than lease block.
+#max_leases	254
+
+# The amount of time that an IP will be reserved (leased to nobody)
+# if a DHCP decline message is received (seconds)
+#decline_time	3600
+
+# The amount of time that an IP will be reserved
+# if an ARP conflict occurs (seconds)
+#conflict_time	3600
+
+# How long an offered address is reserved (seconds)
+#offer_time	60
+
+# If client asks for lease below this value, it will be rounded up
+# to this value (seconds)
+#min_lease	60
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid
+
+# The location of the leases file
+#lease_file	/var/lib/misc/udhcpd.leases
+
+# The time period at which udhcpd will write out leases file.
+# If this is 0, udhcpd will never automatically write leases file.
+# Specified in seconds.
+#auto_time	7200
+
+# Every time udhcpd writes a leases file, the below script will be called
+#notify_file			# default: no script
+#notify_file	dumpleases	# useful for debugging
+
+# The following are bootp specific options
+# next server to use in bootstrap
+#siaddr		192.168.0.22	# default: 0.0.0.0 (none)
+# tftp server name
+#sname		zorak		# default: none
+# tftp file to download (e.g. kernel image)
+#boot_file	/var/nfs_root	# default: none
+
+# Static leases map
+#static_lease 00:60:08:11:CE:4E 192.168.0.54
+#static_lease 00:60:08:11:CE:3E 192.168.0.44
+
+# The remainder of options are DHCP options and can be specified with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines.
+# Examples:
+opt	dns	8.8.8.8 8.8.4.4 #public google dns servers
+option	subnet	255.255.255.0
+opt	router	192.168.30.1
+#opt	wins	192.168.10.10
+#option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+#option	domain	local
+option	lease	864000		# default: 10 days
+# Arbitrary option in hex form:
+option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
+
+# Currently supported options (for more info, see options.c):
+#opt lease      NUM
+#opt subnet     IP
+#opt broadcast  IP
+#opt router     IP_LIST
+#opt ipttl      NUM
+#opt mtu        NUM
+#opt hostname   STRING		# client's hostname
+#opt domain     STRING		# client's domain suffix
+#opt search     STRING_LIST	# search domains
+#opt nisdomain  STRING
+#opt timezone   NUM		# (localtime - UTC_time) in seconds. signed
+#opt tftp       STRING		# tftp server name
+#opt bootfile   STRING		# tftp file to download (e.g. kernel image)
+#opt bootsize   NUM		# size of that file
+#opt rootpath   STRING		# (NFS) path to mount as root fs
+#opt wpad       STRING
+#opt serverid   IP		# default: server's IP
+#opt message    STRING		# error message (udhcpd sends it on success too)
+#opt vlanid     NUM		# 802.1P VLAN ID
+#opt vlanpriority NUM		# 802.1Q VLAN priority
+# Options specifying server(s)
+#opt dns        IP_LIST
+#opt wins       IP_LIST
+#opt nissrv     IP_LIST
+#opt ntpsrv     IP_LIST
+#opt lprsrv     IP_LIST
+#opt swapsrv    IP
+# Options specifying routes
+#opt routes     IP_PAIR_LIST
+# Obsolete options, no longer supported
+#opt logsrv     IP_LIST	# 704/UDP log server (not syslog!)
+#opt namesrv    IP_LIST	# IEN 116 name server, obsolete (August 1979!!!)
+#opt cookiesrv  IP_LIST	# RFC 865 "quote of the day" server, rarely (never?) used
+#opt timesrv    IP_LIST	# RFC 868 time server, rarely (never?) used
+# TODO: in development
+#opt userclass  STRING		# RFC 3004. set of LASCII strings. "I am a printer" etc
+#opt sipserv    STRING LIST	# RFC 3361. flag byte, then: 0: domain names, 1: IP addrs
+#opt staticroutes   STATIC_ROUTES
+#opt msstaticroutes STATIC_ROUTES
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
new file mode 100644
index 0000000..146e2f6
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Ethernet example applications"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+LICENSE = "CC-BY-SA & GPLv2+"
+
+require matrix-gui-apps-git.inc
+
+LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM} \
+                     file://../../udhcpd_eth1.conf;beginline=1;endline=14;md5=70668b1ed5416406a61ef9abdd90d601 \
+"
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+
+# Add a default configuration file for the eth1 connection
+SRC_URI += "file://udhcpd_eth1.conf"
+
+S = "${WORKDIR}/git/ethernet_apps"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}
+    install -m 0755 ${WORKDIR}/udhcpd_eth1.conf ${D}${sysconfdir}
+}
+
+# Make sure ethernet submenu and app images has been installed
+RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-ethernet"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/* \
+                ${sysconfdir}/udhcpd_eth1.conf"
+CONFFILES_${PN} += "${sysconfdir}/udhcpd_eth1.conf"
-- 
1.7.0.4


