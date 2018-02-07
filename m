Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4CE425298F
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 16:35:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w17GZPfc025793
	for <meta-arago@arago-project.org>; Wed, 7 Feb 2018 10:35:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518021325;
	bh=9Fa1p/+DBv+mgN5bfuQb3hOKX2htSOodrX3asvgUXd0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Os2ojqlG7RWwzFSy6RGuGviVJyvvy/oYD5QUAPsNC/HesiUVsPW0/ynNIIKQ+Wf0b
	kva4ygtY2APK+AgHnWFibzKTVESwks9/i4xLIQwf53eq3LzRhNqDjkKv8tZQ3q9L/a
	zeN4TmKVHcQkdl5e0JOjRAU+MLo1CWH/zppJbdyI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w17GZP1C031743
	for <meta-arago@arago-project.org>; Wed, 7 Feb 2018 10:35:25 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Feb 2018 10:35:25 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1261.035; Wed, 7 Feb 2018 10:35:25 -0600
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH] tisdk-paths: add PROC_SDK_INSTALL_DIR
Thread-Index: AQHToC1oVHrkxRnQ+Uy6k701Lq3MxqOZIu7Q
Date: Wed, 7 Feb 2018 16:35:25 +0000
Message-ID: <fb52181b897a440ab3793777d7a4e525@ti.com>
References: <1518018981-12950-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1518018981-12950-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.101.127]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "Nambiath, Raghu" <rnambiath@ti.com>
Subject: Re: [meta-processor-sdk][PATCH] tisdk-paths: add PROC_SDK_INSTALL_DIR
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
X-List-Received-Date: Wed, 07 Feb 2018 16:35:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, February 7, 2018 10:56 AM
To: meta-arago@arago-project.org
Cc: Radhakrishnan, Mahesh; Nambiath, Raghu; Stiffler, Jacob
Subject: [meta-processor-sdk][PATCH] tisdk-paths: add PROC_SDK_INSTALL_DIR

* PROC_SDK_INSTALL_DIR is needed by jailhouse-examples-rtos

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---

* Resolves PRSDK-3527

 recipes-ti/includes/tisdk-paths.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-ti/includes/tisdk-paths.inc b/recipes-ti/includes/tisd=
k-paths.inc
index 300f352..77dac07 100644
--- a/recipes-ti/includes/tisdk-paths.inc
+++ b/recipes-ti/includes/tisdk-paths.inc
@@ -1,4 +1,7 @@
 require recipes-ti/includes/arago-paths.inc
=20
 export TIOVX_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-tiovx-lib-tree"
+export PROC_SDK_INSTALL_DIR_RECIPE   =3D "${installdir}/ti-proc-sdk-rtos-t=
ree"
+
 export TIOVX_INSTALL_DIR      =3D "${STAGING_DIR_TARGET}${TIOVX_INSTALL_DI=
R_RECIPE}"
+export PROC_SDK_INSTALL_DIR   =3D "${STAGING_DIR_TARGET}${PROC_SDK_INSTALL=
_DIR_RECIPE}"
--=20
2.7.4


