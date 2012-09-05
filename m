Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 51F18529A1
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2012 20:14:59 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eh20so1004217obb.38
	for <meta-arago@arago-project.org>;
	Wed, 05 Sep 2012 13:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XE8d+/ndERmjWhJKJ32XfR8dfSU5h/ukLRaRoWSo1nM=;
	b=ZilXDwxivaZxjmSQq2uhFlcAR26r5XyITPtkqNT9tbv/MUo84lUVTQoqNj/tH4qGsl
	lTQRYEGfwwDRvqQ1TgcfUQ8U+N/3mtRkxcHVintJNCuI8S6eXI5eMBZ1LYbmRGhIbNZs
	RKlOBVKxTy797EwuehQGGmblK8ykp0sMojKb577zhDVHRe7A4o84k5sobQkcoCpPQcds
	oRs7lv8NFRtGir+TVdZy7WYVHpBmm8+Gq+hnrtauIIMyN2nx7zAnGu+tBFHYoePdrndo
	Gy91zcVrKL9tRYrYFY+3fqwdsC6jz6ClPp+CAOiKZI2Jt/3PHqm7ClywaiE/X4NLI6yq
	zNfA==
Received: by 10.60.172.135 with SMTP id bc7mr18001739oec.127.1346876099091;
	Wed, 05 Sep 2012 13:14:59 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id bp7sm1380382obc.12.2012.09.05.13.14.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 13:14:58 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  5 Sep 2012 15:31:52 -0500
Message-Id: <1346877112-15989-2-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1346877112-15989-1-git-send-email-fcooper27jr@gmail.com>
References: <1346877112-15989-1-git-send-email-fcooper27jr@gmail.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 2/2 v2] netbase: Port changes from arago
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
X-List-Received-Date: Wed, 05 Sep 2012 20:15:00 -0000

* Add the tiwlan0 entry to the interfaces file to allow bringing up
  the wireless lan interface and properly obtaining an IP address from
  DHCP.
* Report from alpha testing is that the usb0 interface should use dhcp
  instead of a static ip address.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../recipes-core/netbase/netbase/interfaces        |   12 +++++++-----
 .../recipes-core/netbase/netbase_4.47.bbappend     |    2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/netbase/netbase/interfaces b/meta-arago-distro/recipes-core/netbase/netbase/interfaces
index 0acf4cf..15bc31c 100644
--- a/meta-arago-distro/recipes-core/netbase/netbase/interfaces
+++ b/meta-arago-distro/recipes-core/netbase/netbase/interfaces
@@ -11,20 +11,22 @@ iface wlan0 inet dhcp
 	wpa-driver wext
 	wpa-conf /etc/wpa_supplicant.conf
 
+iface tiwlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+
 iface atml0 inet dhcp
 
 # Wired or wireless interfaces
 auto eth0
 iface eth0 inet dhcp
+        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
+
 iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
-iface usb0 inet static
-	address 192.168.7.2
-	netmask 255.255.255.0
-	network 192.168.7.0
-	gateway 192.168.7.1
+iface usb0 inet dhcp
 
 # Bluetooth networking
 iface bnep0 inet dhcp
diff --git a/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend b/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
index c0ab069..997adf2 100644
--- a/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
+++ b/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.7.0.4


