Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 148DA529CE
	for <meta-arago@arago-project.org>;
	Tue, 17 Jul 2018 18:49:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6HInhlg024629
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 13:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531853383;
	bh=k6ODFbhXk1KTc8r5jmNAIRIlLfb71kx36vXeH8GDFnY=;
	h=From:To:CC:Subject:Date;
	b=l0EOSTqtgnJNw/0nKHSjwhcX16WhJWe8tpm41eSQnamuMCRCL5kWNWEKTjc6oexh6
	qDJGOdeiPbOEVOBeOS8hDnWBEptBqs1DKMvY3y6A/5EZTqxeUxItlqAO1zALw4MhMI
	fNLvNoUlrxF031f2rnQ/TtryCaBlIEjiSXK2dClc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HInhv2030956
	for <meta-arago@arago-project.org>; Tue, 17 Jul 2018 13:49:43 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 17 Jul 2018 13:49:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 17 Jul 2018 13:49:42 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6HIngBA017887;
	Tue, 17 Jul 2018 13:49:42 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1ffV2c-0007gS-9y; Tue, 17 Jul 2018 14:49:42 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Jul 2018 14:49:40 -0400
Message-ID: <1531853380-29504-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-tisdk-setup: update to latest
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
X-List-Received-Date: Tue, 17 Jul 2018 18:49:50 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 01bd6c9..d6921d0 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r34"
+PR = "r35"
 
 BRANCH ?= "master"
-SRCREV = "55a17a0d1c5b385eec620c5f51e1d4e5ca6905cd"
+SRCREV = "c6517247c9bc5564bbe63d7322314010ac28b1c3"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
1.9.1


