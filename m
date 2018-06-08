Return-Path: <x0038811@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id DA50A529BA
	for <meta-arago@arago-project.org>;
	Fri,  8 Jun 2018 11:26:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w58BQJxk009386
	for <meta-arago@arago-project.org>; Fri, 8 Jun 2018 06:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528457179;
	bh=VC2MB6BA7E1Ufp2ksy2zoTkl5xbKBC6EX8ZD4sm8Ckg=;
	h=From:To:CC:Subject:Date;
	b=S826i1Z/rql8kW4Jo6qMBOrP8kuZJ5AM4cJFXtiN2hLDrXUyHhfRSVHhJ4YE98R62
	Rxs+IkJ0x+9ueUs5jIRdjYg9eJnij8Dreuo00VEul4dDfJO8GtB9Qk17cF41aCb+Hc
	lAb72zgqN1NGsP0AyzF4RXzHbNDm9nNnxfuNrj0s=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w58BQJkX021031
	for <meta-arago@arago-project.org>; Fri, 8 Jun 2018 06:26:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 8 Jun 2018 06:26:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 8 Jun 2018 06:26:19 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w58BQHAe028663;
	Fri, 8 Jun 2018 06:26:18 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Jun 2018 16:56:11 +0530
Message-ID: <1528457173-29368-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko]
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
X-List-Received-Date: Fri, 08 Jun 2018 11:26:27 -0000
Content-Type: text/plain

Bump SRCREV of gst-vpe and gst-ducati with latest commit-ids

Ramprasad N (2):
  gstvpe: Bump SRCREV with latest fixes
  gst-ducati: Bump SRCREV with latest commit

 .../gstreamer1.0-plugins-ducati_git.bb             |  4 +--
 ...late-the-output-structure-with-progressiv.patch | 33 ----------------------
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  5 ++--
 3 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch

-- 
1.9.1


