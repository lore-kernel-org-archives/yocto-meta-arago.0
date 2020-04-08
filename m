Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8F55252AAC
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 82B4D40C1D;
	Wed,  8 Apr 2020 00:45:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 07SXFvJnziu7; Wed,  8 Apr 2020 00:45:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 43F4A40C3A;
	Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 14E1A171A7A;
	Tue,  7 Apr 2020 20:45:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:50 -0400
Message-Id: <1586306702-7953-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 12/24] ti-fftw: require dsp machine and opencl distro features
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb b/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
index abb5f60..84b6ba1 100644
--- a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
+++ b/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
@@ -7,6 +7,11 @@ LIC_FILES_CHKSUM = "file://docs/TI-FFTW_3.1.0_manifest.html;md5=aaa275ec704a7382
 
 include fftlib.inc
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+REQUIRED_DISTRO_FEATURES = "opencl"
+
 PR = "${INC_PR}.0"
 
 DEPENDS = "common-csl-ip-rtos common-csl-ip ti-xdctools-native ti-sysbios ti-cgt6x-native ti-xdais libulm fftlib dsplib-c66x opencl clocl-native libarch"
-- 
2.7.4


