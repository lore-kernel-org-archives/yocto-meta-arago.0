Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 78FCA52A48
	for <meta-arago@arago-project.org>;
	Tue, 10 Oct 2017 09:02:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9A92CTN012468
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507626132;
	bh=dsAx3CJHlXJvmorxPy5TDBbYG2xMsIoc2FRVbBj2bE0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Fs9wqpfBlUY3aVAjSMGjnGNFcvVxrln4FLUIn+MpWPyI7oxEpDFoNNMdANZwE+WO9
	QwnN+Kt1g2Ll1ORkdhOQNfwwYirxuvK7A3ALP3Sfy0WUkXGN5YCV2yRFYtutwE0RB8
	G3otiZsp28Gx240yUT8PCN1lSLEuAho/k1oS0jOY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A92Cgg002346
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 04:02:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 04:02:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 04:02:12 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A928TU030144;
	Tue, 10 Oct 2017 04:02:11 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Oct 2017 14:32:03 +0530
Message-ID: <1507626126-149180-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507626126-149180-1-git-send-email-a0393906@ti.com>
References: <1507626126-149180-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth 3/6] omapdrmtest: Update SRCREV
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
X-List-Received-Date: Tue, 10 Oct 2017 09:02:12 -0000
Content-Type: text/plain

This update fixes the following issues:
 * viddec3test: dce_buf_lock & unlock of OutBuf_fd
 * display-wayland: enable cropping support
 * viddec3test: fixed --inloop Segmentation fault issue.
 * viddec3test:Handling outBufsInUseFlag for interlaced contents
 * viddec3test: Set correct padding width height for MPEG4
 * v4l2: Make sure v4l2_format stack variable is initialized
 * capturevpedisplay: Use single plane for input format
 * vpe-common: Use single plane buffer for NV12 by default
 * capturevpedisplay: Use single plane buffer by default
 * vpe: Remove unnecessary G_FMT call
 * dmabuftest: Fix spacing and compile warning
 * caturevpedisplay: Fix compile warning
 * filevpedisplay: Fix compile warning
 * v4l2: Fix white-space issue and compile warning
 * vpe-common: Fix white-space issue and compile warning
 * display-kms: Fix compile warning
 * vpe-common: Disable crop
 * display-kms: Call SetCrtc at init time
 * display-kmscube: Add support for RGB texture
 * filevpedisplay: Change argument numbers for kmscube support
 * display-wayland:Create a thread to dispatch events
 * display-wayland: Add frame-listener and dispatch

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index d4b42a8..a753b7e 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r19"
-SRCREV = "116c940c2b06b221c13be28bb79af49233ba462a"
+PR = "r20"
+SRCREV = "6d81a5c7dc998a914c482bd8aef0d6b2ffd3aa09"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
 "
-- 
1.9.1


