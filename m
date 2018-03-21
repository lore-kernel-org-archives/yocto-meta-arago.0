Return-Path: <yesipov@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by arago-project.org (Postfix) with ESMTPS id C9AD6529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 06:53:09 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id c78-v6so1548109lfh.1
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/o5wbF+y0sTHJTjqfGHNCKmIOfilgkOPGEEOwgq3kLk=;
	b=PhMsWN+4KmAkKuc08DPywy0Js3mkRRr9bVlRR62Emw6oKHU1aiPjjEpveFgS6C7MGr
	QXNVX3ScCVNOazR0Sy9cLogUQn9tQfvqG78iEOzJSHX50kPlCz1IRMl7XiY9THp8oUrc
	Uhu42HFlxmCnh/4fHXYZa3/OmceDqxu5iZi8vDRclGRvQih4b48/5271x2sEW4dExlvo
	WLKhiemNKZkRkuSdAtNy6sBZF+cZrPzg9HZkRcTLy7CSW58FAwypFndFpvvi9ABbiTOM
	SoQi5f8As3Ek5DGNGvouHBV3Kvvp6Aw82HKxIggw8j6+Q0HxP2lbKuuDkd4T8eEilxN0
	NmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/o5wbF+y0sTHJTjqfGHNCKmIOfilgkOPGEEOwgq3kLk=;
	b=MUfBhtAv7+NAfTpzxgR5oeTG3On3enjNYltrL2B/fgi/7HJMarGlN5wF3Z7yeFRxYs
	kwURZgMy4BKR7BJ6SN/j80DiF4Wjdf3GFykxpgClKKSWBqn2HksvWRFD8/ICPvEq+zyv
	vfNl8BwXSPm2DxlAjiju4OFwvHRf/v6MohI/brjzmqRkJFUN0vhsfvesMZfx9NzbR1UZ
	5UHi8LoY0xW5679bRupIrZPWiXEfel3t3VpYp5fORCCPg9y/eTYLq0FZMoe61Ta4NTCG
	kF938Z9aX6pw2GSbwxmyNoV7VFj9mYtdR5gN9z2b0khvin6Vio31cICWiS2wWxT9AACM
	WBPg==
X-Gm-Message-State: AElRT7HVCCemBbqTDLK9/Kj/JxwZJ/gsCfV/lNI7qSIVD9WmOy+/Bciz
	SiLe4Cjx4ULYj2nDPQ/SZwXgFQ==
X-Google-Smtp-Source: AG47ELtlXiOYbBEU7DhcCJMas2Ft3QkfNl6SKLdC6Uyo3NBTb/tbjvPP+dlwkTi0eTwhcOg0xnQKHg==
X-Received: by 10.46.124.13 with SMTP id x13mr13241869ljc.6.1521615128753;
	Tue, 20 Mar 2018 23:52:08 -0700 (PDT)
Received: from nw.d-systems.local ([185.75.190.112])
	by smtp.gmail.com with ESMTPSA id
	f26-v6sm858594lfl.83.2018.03.20.23.52.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 23:52:08 -0700 (PDT)
From: Kirill Esipov <yesipov@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 21 Mar 2018 09:51:40 +0300
Message-Id: <1521615100-30219-1-git-send-email-yesipov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] initscript-telnetd: fix stopping daemon
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
X-List-Received-Date: Wed, 21 Mar 2018 06:53:10 -0000

Stop with --exec options, as no pidfile was generated on start.
---
 .../recipes-connectivity/initscript-telnetd/initscript-telnetd.bb       | 2 +-
 .../recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
index d71540f49bd1..e492119b337b 100644
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Initscripts for telnetd"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://telnetd;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
-PR ="r0"
+PR ="r1"
 
 SRC_URI = "file://telnetd"
 
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
index 116dd6d159f6..a99f23ef2483 100644
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
@@ -29,7 +29,7 @@ case "$1" in
     ;;
   stop)
     echo -n "Stopping telnet daemon"
-    start-stop-daemon --stop --quiet --pidfile /var/run/telnetd.pid
+    start-stop-daemon --stop --quiet --exec $telnetd
     echo "."
     ;;
   *)
-- 
2.7.4


