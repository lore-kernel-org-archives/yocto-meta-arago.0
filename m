Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.10126.1646757854357882840
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 08:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DUiZLv3Z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 228Gi9WW099580;
	Tue, 8 Mar 2022 10:44:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646757849;
	bh=Hhj9BjUyUz0OwnwfwzJ1DRO8g/pIiKj938jzT+2qcxo=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=DUiZLv3ZF9HXNDuektnpu48aOzmztycyFZJ92KmjVmuZMTS4Z/0AUrkMdWaLbXZSh
	 ApLJ8vhk4AhT+UAJFNMEBG3fpxSAhCi8nN2sWsDqUL9lAVxTdXcAyoVeO9PLHOKApx
	 8UnvcwTfcMDbDl9Poa+a9593FRqRCwldeT6pg6Fw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 228Gi9oD004091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 10:44:09 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 10:44:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 10:44:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 228Gi80s072798;
	Tue, 8 Mar 2022 10:44:09 -0600
Date: Tue, 8 Mar 2022 10:44:08 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Dave
 Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan" <j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman, Kevin" <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] [dunfell/master PATCH] recipes-core: images: Add tisdk-thinlinux-image
Message-ID: <20220308164408.ychl73mhxwgn2ool@pretty>
References: <16DA6F21B0B58E2E.3140@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16DA6F21B0B58E2E.3140@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 08:46-20220308, Nishanth Menon via lists.yoctoproject.org wrote:
[...]
Self review comment..

> +
> +export IMAGE_BASENAME = "tisdk-thin-image"

should be tisdk-thinlinux-image

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
