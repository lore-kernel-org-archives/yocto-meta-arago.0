Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id DC7A2529A1
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2012 20:11:13 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eh20so997318obb.38
	for <meta-arago@arago-project.org>;
	Wed, 05 Sep 2012 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qqmWsW9K1mSJRSezZgJWtTdpllcXQdJaR+TWNlLm1gY=;
	b=BZzz8yKKFxRFvjx1YFkgdZG3pag3eCxOIlH9CVYhm2+WfAWqmgptz8H8ARJX3KyhIC
	t6okgF6777hTH/ZXPsVZizIy43GCzg7Nc8OaTGbYWQsIxboDc8JQ8fVWnkPNdUd+l1sE
	LnGiGMTlUCdS7XorcB7BlBJhWJV9lvcwBVU3A1CmlB24rNvVgBlHzx5s64TcxIOFU07h
	lJ0XjRKGvhCPUCDBRk1puZPsEj/VmahePSo9Qp/MgpMTQeW/mcFo7T+WRsLdVlTURFEv
	fbeQLtjeKZPzgHAiLxya0aP04I0dikalIPSHwg+tLovu+tEM09fscuyFgdRwRG4TR9M6
	SofA==
Received: by 10.60.20.197 with SMTP id p5mr18605514oee.32.1346875873745;
	Wed, 05 Sep 2012 13:11:13 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ac10sm1374416obc.7.2012.09.05.13.11.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 13:11:13 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  5 Sep 2012 15:28:01 -0500
Message-Id: <1346876881-15820-2-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1346876881-15820-1-git-send-email-fcooper27jr@gmail.com>
References: <1346876881-15820-1-git-send-email-fcooper27jr@gmail.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 2/2] netbase: Port changes from arago
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
X-List-Received-Date: Wed, 05 Sep 2012 20:11:14 -0000

* Add the tiwlan0 entry to the interfaces file to allow bringing up
  the wireless lan interface and properly obtaining an IP address from
  DHCP.
* Report from alpha testing is that the usb0 interface should use dhcp
  instead of a static ip address.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../recipes-core/netbase/netbase/interfaces        |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

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
-- 
1.7.0.4


