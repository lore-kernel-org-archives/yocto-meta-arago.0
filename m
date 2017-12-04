Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id ACEEA52A40
	for <meta-arago@arago-project.org>;
	Mon,  4 Dec 2017 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFA51207BA;
	Mon,  4 Dec 2017 21:17:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MYa9y3pfwzRB; Mon,  4 Dec 2017 21:17:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 83FAF20AD6;
	Mon,  4 Dec 2017 21:17:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F3384162753;
	Mon,  4 Dec 2017 16:17:13 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  4 Dec 2017 16:17:09 -0500
Message-Id: <1512422231-43396-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512422231-43396-1-git-send-email-denys@ti.com>
References: <1512422231-43396-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/4] pybind11: use git sources to pull latest due to some regressions
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
X-List-Received-Date: Mon, 04 Dec 2017 21:17:17 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/python/python3-pybind11_2.2.1.bbappend          | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend

diff --git a/meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend b/meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend
new file mode 100644
index 0000000..fd1fbf9
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python/python3-pybind11_2.2.1.bbappend
@@ -0,0 +1,5 @@
+LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/pybind/pybind11.git"
+SRCREV = "086d53e8c66a84d0ec723d5435918c76edd878e8"
+PV = "2.2.2+2.2.1-git"
-- 
2.7.4


