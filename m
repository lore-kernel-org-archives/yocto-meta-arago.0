Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.4245.1645596709129226704
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 22:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=legU2y1B;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21N6BjRo111352;
	Wed, 23 Feb 2022 00:11:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645596705;
	bh=vIzbCVxZKJmQul1yZXed0hJVhj5pztPzcPZOheWH4KI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=legU2y1BIezR0eBgsPmHI3ETl1voSroSUuooMdegHyRqqNkp2VMq30SzsWW0m1fV9
	 Ubg4p7lDyE3lLbqr6Li5dk3VUjwnKbc3kDcmTYqUOp9SwszKV3lfyn7G5E5CLj9whj
	 Ne1S0JQrgwbQ2OkbioZ3d83kaUOHPFoBlbMjaWBw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21N6BjqZ020356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Feb 2022 00:11:45 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 00:11:44 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 00:11:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21N6BhN0061124;
	Wed, 23 Feb 2022 00:11:44 -0600
Date: Wed, 23 Feb 2022 11:41:43 +0530
From: "Aparna M" <a-m1@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>
Subject: Re: [meta-arago][PATCH] matrix-gui-apps-git: Update SRCREV to latest
Message-ID: <20220223060954.bhe7q2qgmmpx7yq3@ti.com>
References: <20220221040324.31841-1-a-m1@ti.com>
 <20220222004231.GK26229@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220222004231.GK26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Denys,

The SRCREV update is to pick up a change in the out-of board LED blink
demo for am64xx-evm. Will update the commit message and send a v2 of the
patch.

Thanks,
Aparna
