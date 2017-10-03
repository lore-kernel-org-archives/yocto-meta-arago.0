Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 1CD98529C7
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 21:03:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93L31HM024192
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507064581;
	bh=MFdl5R98tqPR3qgfJHA3Il9RuwcSpWWPwoLTxUKmiiU=;
	h=From:To:Subject:Date;
	b=f7MfkBApmAuuqznqI+vsHDx9U6Jqx2G42YnRk1FvxFQC1ls3oQls9ZYB4tBO2kC4A
	qNZBzfR092e1r4dvJEgG1imvakSiEmh/rfxCVZ3n+0J3oYaajq8szWprAH8Nhsao84
	JD8Ya2qAKuSTqeGYYLWtRvEZfbMutd8L67wSMyI0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93L31V0026505
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 16:03:00 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 16:03:00 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93L30fB028952
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:00 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 17:02:55 -0400
Message-ID: <1507064577-60360-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 0/2] Add X11 Build Support
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
X-List-Received-Date: Tue, 03 Oct 2017 21:03:01 -0000
Content-Type: text/plain

rebase the following two patches

Eric Ruei (2):
  packagegroup-arago-test-addons: remove omapdrmtest for X11(xsgx) build
  packagegroup-arago-tisdk-addons(-sdk-target): removed unsupported
    modules for X11(xsgx) build

 .../packagegroups/packagegroup-arago-test-addons.bbappend      |  5 ++++-
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend        | 10 ++++++----
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend     | 10 ++++++----
 3 files changed, 16 insertions(+), 9 deletions(-)

-- 
1.9.1


