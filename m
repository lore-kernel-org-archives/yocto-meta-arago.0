Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.592.1645571163711553138
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 15:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MWXELP6O;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21MN6081036591;
	Tue, 22 Feb 2022 17:06:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645571160;
	bh=+nClHBKp+jMy3M0M2yrNj0KrabKs+qB1b5K/bUY/CvU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MWXELP6O85hcx5X3kOOnFWnNp4X7cU1SAi/3L0nh+EQOZS2iZEqcDwYjcHVBFcdmb
	 s4xNvKzMOKwO6eMlxNXnsgGNtk3L7wGTYWn6wNQeoE+/V6wlGezLdxcoKEbDdkJpb7
	 I51iK6Ggjh1LkiXhYlPagocHMngXNIhYNq8YT24Y=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21MN60oT101978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Feb 2022 17:06:00 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Feb 2022 17:06:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Feb 2022 17:06:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21MN6021110579;
	Tue, 22 Feb 2022 17:06:00 -0600
Date: Tue, 22 Feb 2022 17:06:00 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH 3/3] Revert "linux-ti-staging: enable necessary configs for running docker containers"
Message-ID: <20220222230600.ovnwm5smk7hwr7jo@unbaked>
References: <20220211123814.12258-1-reatmon@ti.com>
 <20220211123814.12258-4-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220211123814.12258-4-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 06:38-20220211, Ryan Eatmon via lists.yoctoproject.org wrote:
> This reverts commit 628e99b8811678b4305b1175580e70ad00ec933f.
> 
> These patches add to the size of the base image.  We have plans on
> reworking the images and will reapply this patch at that time.


NAK. we should'nt be dropping docker completely.


Also please signed-off-by your patches?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
