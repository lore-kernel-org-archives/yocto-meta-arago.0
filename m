Return-Path: <x0038811@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B09F252987
	for <meta-arago@arago-project.org>;
	Wed,  6 Mar 2019 10:35:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x26AZHwk042564
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 04:35:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551868517;
	bh=9OO2r2TedsGdAMIT2VRutQIx7ZuxCxI1s3m3IvlP9KI=;
	h=From:To:CC:Subject:Date;
	b=ZJdL4F5yGu2tyFNjcccHFKTDgrifY94xuAzVTLgQY1a10KYSWHdDnqitpnWA+igM8
	RhYlrOTSP/vLSM3HTNJZFNOJ4RXD0Cxrbz4RfS6xO2X1LMID/SXxDrYNu3pRKETtfz
	PIBWSdPOzuccFgc64I5QmVHd4s8+QwK7LXUD5rts=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x26AZHxn044199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 04:35:17 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 04:35:16 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 04:35:16 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x26AZFxa010172;
	Wed, 6 Mar 2019 04:35:15 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Mar 2019 16:05:10 +0530
Message-ID: <1551868512-30142-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 0/2] gstreamer1.0*-good updated patches
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
X-List-Received-Date: Wed, 06 Mar 2019 10:35:25 -0000
Content-Type: text/plain

This changes are to
* clean up the 1.12.2 patch 
* create new patch on 1.14.4

Ramprasad N (2):
  gstreamer1.0*-good: Clean up the failing patch
  gstreamer1.0*-good: Update the good patch for gst 1.14.4

 ...v4l2src-Increase-minimum-num-buffers-by-3.patch | 31 +++++++++++++++
 ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ----------------
 ...2src-Use-generic-dmabuf-import-in-v4l2src.patch | 45 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.12.4.bbappend      |  7 ----
 .../gstreamer1.0-plugins-good_1.14.4.bbappend      |  8 ++++
 5 files changed, 84 insertions(+), 40 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-3.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bbappend

-- 
1.9.1


