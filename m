Return-Path: <x0038811@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E92C8529F5
	for <meta-arago@arago-project.org>;
	Tue,  5 Jun 2018 11:21:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w55BKuff015895
	for <meta-arago@arago-project.org>; Tue, 5 Jun 2018 06:20:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528197656;
	bh=pyPoES1mhOv6GewbdCI9mvPNmO02rK/FJuRYPvYcegY=;
	h=From:To:CC:Subject:Date;
	b=uRRKs2TnSQrfWTVbrnU2W7K/+I1OC2UZFZ632BJVb6lZJFUFa1ifDWMp8K41EyU/p
	LgUjwcStH/XeJX5p4Ulvouq/VhTfH1gR/U4LP81UYJWhD/ZIIRYFluFU20b1DkArVe
	raXMhPxSe6lCWoEG2C7zOgdyBuj4inrpGBmHUkr8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w55BKue1028586
	for <meta-arago@arago-project.org>; Tue, 5 Jun 2018 06:20:56 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 5 Jun 2018 06:20:56 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 5 Jun 2018 06:20:56 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w55BKsZc013661;
	Tue, 5 Jun 2018 06:20:55 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Jun 2018 16:50:51 +0530
Message-ID: <1528197652-4249-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [example-applications rocko 0/1]
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
X-List-Received-Date: Tue, 05 Jun 2018 11:21:04 -0000
Content-Type: text/plain

Bump SRCREV for exaple-applications

Ramprasad N (1):
  example-applications: Bump SRCREV with latest commit

 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


