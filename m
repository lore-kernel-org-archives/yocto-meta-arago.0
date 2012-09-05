Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 36F01529A1
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2012 20:11:12 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so997318obb.38
	for <meta-arago@arago-project.org>;
	Wed, 05 Sep 2012 13:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WMirkvrfDOiATSMRiZA30MIgfxljvVYOX8QXuM2NlJ0=;
	b=rSSi/n2f9Y6dS4VogzDS8+3hZL04nNKAN7SdCZoGx0UQ2b0I4SFBNU+YfHsE40zY/s
	2zQAuXMr7D3Gx1/j0fn5EFe7M6Sh6OIbzDqiM1y4f4V7bdTyQ1wti6u92gVUdBnLfx21
	o6v/wUrnxRoyFMNZlcQZl0haVnFmtjYzUmxOsoQob8l2+1kghB3SPVVGEKvbvGXwJBFc
	2DxIce70EQQQ/8P8ocGTSjFCPVoujKk0fkdb5m6r3k/SSPfldWHMfsfDyRBbRBQ+VoW3
	Cv98cvTpDmKCk9cgITJpVDThehEBlX7XLZKT0E//uQVFqJeuRHXaKTwF0NoG7uUYmMYp
	aHpw==
Received: by 10.60.13.71 with SMTP id f7mr18720932oec.43.1346875871027;
	Wed, 05 Sep 2012 13:11:11 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ac10sm1374416obc.7.2012.09.05.13.11.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 13:11:10 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  5 Sep 2012 15:28:00 -0500
Message-Id: <1346876881-15820-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 1/2] netbase: Add base interfaces file
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
X-List-Received-Date: Wed, 05 Sep 2012 20:11:12 -0000

* Grab base interfaces from oe-core.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../recipes-core/netbase/netbase/interfaces        |   31 ++++++++++++++++++++
 .../recipes-core/netbase/netbase_4.47.bbappend     |    4 ++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/netbase/netbase/interfaces
 create mode 100644 meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend

diff --git a/meta-arago-distro/recipes-core/netbase/netbase/interfaces b/meta-arago-distro/recipes-core/netbase/netbase/interfaces
new file mode 100644
index 0000000..0acf4cf
--- /dev/null
+++ b/meta-arago-distro/recipes-core/netbase/netbase/interfaces
@@ -0,0 +1,31 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wireless interfaces
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+iface atml0 inet dhcp
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet dhcp
+iface eth1 inet dhcp
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+iface usb0 inet static
+	address 192.168.7.2
+	netmask 255.255.255.0
+	network 192.168.7.0
+	gateway 192.168.7.1
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
diff --git a/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend b/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
new file mode 100644
index 0000000..c0ab069
--- /dev/null
+++ b/meta-arago-distro/recipes-core/netbase/netbase_4.47.bbappend
@@ -0,0 +1,4 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
-- 
1.7.0.4


