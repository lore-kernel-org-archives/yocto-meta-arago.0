Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 88C5E529DB
	for <meta-arago@arago-project.org>;
	Thu, 24 Oct 2019 17:02:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OH0mZk018803
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 12:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571936449;
	bh=YXlSLRk9CvgM7aiLK/4PHwd/43lrMes1S5uw4eQJN+M=;
	h=From:To:CC:Subject:Date;
	b=DSwamcHqUpnVg8hk80u5h3CjRCW3hi82oPKBBaNjPeinDEKE75jd0xhUcDRZlvkWL
	905vtKQF15oQfxY4iVQJ3omtJftRLCup2+7EfLJ3/FT0zX5IMhoK8dFettxGLPTabK
	S1RVTchHC0y8N3mIyCeLbqhuVqTe547SEdZ6eZcU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OH0mPS096353
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 12:00:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 24 Oct 2019 12:00:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 24 Oct 2019 12:00:38 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OH0m31129790;
	Thu, 24 Oct 2019 12:00:48 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Oct 2019 12:58:10 -0400
Message-ID: <20191024165813.21958-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 0/3] Update tensorflow lite to version 1.15.0
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
X-List-Received-Date: Thu, 24 Oct 2019 17:02:08 -0000
Content-Type: text/plain

* tensorflow lite version 1.15.0 requires flatbuffers version 1.10.0
* corresponding changes are also made for armnn which depends on tensorflow lite and flatbuffers

Hongmei Gou (3):
  flatbuffers: create version 1.11.0
  tensorflow-lite: update to version 1.15
  armnn: udpate with tensorflow lite version 1.15.0

 ...uffers_1.10.0.bb => flatbuffers_1.11.0.bb} |  2 +-
 .../recipes-support/armnn/armnn_git.bb        |  6 +-
 ...kefile-add-label_image-example-1.15.patch} | 73 +++++++--------
 ...dification-for-tflite-1.15-to-eigen.patch} | 10 +-
 ...w-lite_1.12.bb => tensorflow-lite_1.15.bb} | 92 +++++++++----------
 5 files changed, 87 insertions(+), 96 deletions(-)
 rename meta-arago-extras/recipes-devtools/flatbuffers/{flatbuffers_1.10.0.bb => flatbuffers_1.11.0.bb} (94%)
 rename meta-arago-extras/recipes-support/tensorflow-lite/files/{0001-Makefile-add-label_image-example.patch => 0001-Makefile-add-label_image-example-1.15.patch} (45%)
 rename meta-arago-extras/recipes-support/tensorflow-lite/files/{apply-modification-for-tflite-1.12-to-eigen.patch => apply-modification-for-tflite-1.15-to-eigen.patch} (45%)
 rename meta-arago-extras/recipes-support/tensorflow-lite/{tensorflow-lite_1.12.bb => tensorflow-lite_1.15.bb} (51%)

-- 
2.17.1


