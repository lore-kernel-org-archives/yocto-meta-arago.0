Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E159B529A5
	for <meta-arago@arago-project.org>;
	Wed,  1 Nov 2017 17:59:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA1Hxw99026220
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 12:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509559198;
	bh=4x6qv3LGlz6uZ+mzsLl0Y3wGzkeONPZB6Qqvd8DTkac=;
	h=From:To:CC:Subject:Date;
	b=cHHeyvmFMNzg3GR8Xj2EsD4gKzpqWLMsATUs1HlEfmZXW1E29+X5zHQAchB0AJYHt
	IThEVvts54OsT0l7GNjHX69Kzp6qBVwTL43jOB/2MmKLbMygE2akM5l5qthQ7jiS4D
	ozxyCHriUVaZA0FVedZFGS99aHPwaNGTQSC5lqTs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1HxwQ6028056
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 12:59:58 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 1 Nov 2017 12:59:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 1 Nov 2017 12:59:58 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1Hxwlv025569;
	Wed, 1 Nov 2017 12:59:58 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1e9xJ0-0006xb-3i; Wed, 01 Nov 2017 13:59:58 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Nov 2017 13:59:56 -0400
Message-ID: <1509559196-26703-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk-morty-config: add meta-ros layer
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
X-List-Received-Date: Wed, 01 Nov 2017 17:59:59 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-morty-config.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/processor-sdk/processor-sdk-morty-config.txt b/configs/processor-sdk/processor-sdk-morty-config.txt
index 49d4957..ad5e815 100644
--- a/configs/processor-sdk/processor-sdk-morty-config.txt
+++ b/configs/processor-sdk/processor-sdk-morty-config.txt
@@ -4,6 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,HEAD,layers=
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
-- 
1.9.1


