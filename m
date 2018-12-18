Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7622B52A63
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 02:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C3A4340AC8;
	Tue, 18 Dec 2018 02:06:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id S-icMfUQuDHA; Tue, 18 Dec 2018 02:06:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7DD1B40A35;
	Tue, 18 Dec 2018 02:06:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C3E66167856;
	Mon, 17 Dec 2018 21:06:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Dec 2018 21:06:46 -0500
Message-Id: <1545098806-42490-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] python-pybind11: drop local older version, meta-oe has 2.2.3 now
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
X-List-Received-Date: Tue, 18 Dec 2018 02:07:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/python/python3-pybind11_2.2.1.bbappend      | 5 -----
 meta-arago-extras/recipes-devtools/python/python-pybind11.inc    | 9 ---------
 .../recipes-devtools/python/python-pybind11_2.2.1.bb             | 2 --
 .../recipes-devtools/python/python3-pybind11_2.2.1.bb            | 2 --
 4 files changed, 18 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-pybind11.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-pybind11_2.2.1.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python3-pybind11_2.2.1.bb

diff --git a/meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend b/meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend
deleted file mode 100644
index fd1fbf9..0000000
--- a/meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
-S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/pybind/pybind11.git"
-SRCREV = "086d53e8c66a84d0ec723d5435918c76edd878e8"
-PV = "2.2.2+2.2.1-git"
diff --git a/meta-arago-extras/recipes-devtools/python/python-pybind11.inc b/meta-arago-extras/recipes-devtools/python/python-pybind11.inc
deleted file mode 100644
index 0f3d3cc..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-pybind11.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Seamless operability between C++11 and Python"
-HOMEPAGE = "https://github.com/wjakob/pybind11"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5399ae4d93a67b891d79b1e1cbfa4593"
-PR = "r0"
-
-SRC_URI = "https://pypi.python.org/packages/c9/f7/fc9c44bf088d942c71b04646891034036a63e5bd00daff1c9a377e0f5a9f/pybind11-2.2.1.tar.gz"
-SRC_URI[md5sum] = "f454d8991f47befe56d4126df861fc96"
-SRC_URI[sha256sum] = "a96a924fae6e2721efbf24f47561284fd1ea0b655619a8621c4423036183b824"
diff --git a/meta-arago-extras/recipes-devtools/python/python-pybind11_2.2.1.bb b/meta-arago-extras/recipes-devtools/python/python-pybind11_2.2.1.bb
deleted file mode 100644
index e567430..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-pybind11_2.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pybind11.inc
diff --git a/meta-arago-extras/recipes-devtools/python/python3-pybind11_2.2.1.bb b/meta-arago-extras/recipes-devtools/python/python3-pybind11_2.2.1.bb
deleted file mode 100644
index 355e284..0000000
--- a/meta-arago-extras/recipes-devtools/python/python3-pybind11_2.2.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-pybind11.inc
-- 
2.7.4


