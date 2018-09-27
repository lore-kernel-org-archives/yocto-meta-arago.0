Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 92B5452090
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 21:01:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RL1mXe101445
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538082108;
	bh=GqT3dL20UspoDruYDnhkcxPKZOTBxN07J2SXXMMPlRU=;
	h=From:To:Subject:Date;
	b=KNkP7J7FxeJ4Y49aS9HZK51/09kT8nabZOvoAc2B6JxjC78WSa8u3zGa4/zS1hlNS
	r3DDEu21jw+VWb/IU5SyhLncmxswDR7o4g8W9sF/LTnkS7PXNPrIiYLZ2gKmId740m
	Yj/DXA4yCaW26vmcL3iACkZahTOgiKLI15TVC7QY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RL1jAL030275
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:01:48 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:01:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:01:45 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RL1j7l025863
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:01:45 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 17:01:42 -0400
Message-ID: <1538082103-53023-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [[meta-processor-sdk][PATCH v2] Re-submitting the branch with proper subject prefix
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
X-List-Received-Date: Thu, 27 Sep 2018 21:01:57 -0000
Content-Type: text/plain

In the previous version of the patch the subject line had "morty" in it.
It has been removed.

Mahesh Radhakrishnan (1):
  board-rtos: Removing the bbappend as the changes are upstreamed to
    meta-ti

 recipes-bsp/board-rtos/board-rtos_git.bbappend | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

-- 
1.9.1


