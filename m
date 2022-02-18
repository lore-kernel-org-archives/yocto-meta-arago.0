Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8426.1645172698832991058
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 00:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iPHej8q+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21I8Ovjw110787
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Feb 2022 02:24:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645172697;
	bh=Wl0qZBZbwx+lCBHWo8v9dhcI9nnwA7bdcH2Qw7vKGiM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iPHej8q+FLOegNr+ztcYYGFL4Mbh10bZ9Ehd9C4tBX1RNl8HyqEJsKQyIEjNq7qVx
	 3PvYx7uyv1sv2MIwqTaj5+7foFuRmlsWFBjqBB47PfMHMmQFB+MkYk5VlfjI8TAUCF
	 ZDq2JdHsizCiu+8idqnzXlG3fex6CypMp4U9KvXs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21I8Ovc7009181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 18 Feb 2022 02:24:57 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Feb 2022 02:24:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Feb 2022 02:24:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21I8Ou59081558;
	Fri, 18 Feb 2022 02:24:57 -0600
Date: Fri, 18 Feb 2022 13:54:52 +0530
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <nsekhar@ti.com>, <nikhil.nd@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] processor-sdk: Add 08.01.00.39 release config
Message-ID: <20220218082452.54j5uq4oxpug5zls@ti.com>
References: <20220218081939.25460-1-a-m1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220218081939.25460-1-a-m1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi All,

Please ignore this patch. Sorry about the spam.

Thanks,
Aparna
