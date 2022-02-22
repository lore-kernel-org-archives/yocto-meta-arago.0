Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.680.1645571536579188171
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 15:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dhqMeW/Q;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-humphreys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21MNCEkt038181;
	Tue, 22 Feb 2022 17:12:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645571534;
	bh=OBiku4e7ZWhXYSD75huxcDBQ2M+MTD/7IQ2lTLREwAc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=dhqMeW/QhOocwq1+XCV2eqCiX3ddwFcnbvhrcPUToBJ5awk9o2RJ2i/PbhU0Cu5Oy
	 4EIOGG5p8KQPpbhN93bmPH0YyeeYqUZOO+br8wpq6+DXMmFUKmyouwTFuPZL1f/KVM
	 xF7A1DNXqpp5RLgBUgbZC4U2zg6rNEQLIp3/t1ac=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21MNCExg032338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Feb 2022 17:12:14 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Feb 2022 17:12:14 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2308.014; Tue, 22 Feb 2022 17:12:13 -0600
From: "Jonathan Humphreys" <j-humphreys@ti.com>
To: "Menon, Nishanth" <nm@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>
CC: "Siraswar, Yogesh" <yogeshs@ti.com>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH 3/3] Revert "linux-ti-staging: enable necessary configs for running docker containers"
Thread-Topic: [meta-arago][dunfell][PATCH 3/3] Revert "linux-ti-staging:
 enable necessary configs for running docker containers"
Thread-Index: AQHYH0RgEbhUY/D9wEmr8W6d4nzjFKygp48A//+c9aA=
Date: Tue, 22 Feb 2022 23:12:13 +0000
Message-ID: <a5f41b267b9440269fc1fefc2fda7bb0@ti.com>
References: <20220211123814.12258-1-reatmon@ti.com>
 <20220211123814.12258-4-reatmon@ti.com>
 <20220222230600.ovnwm5smk7hwr7jo@unbaked>
In-Reply-To: <20220222230600.ovnwm5smk7hwr7jo@unbaked>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.29.157]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

+ Minas

Minas, are we seeing docker container failures in testing?

-----Original Message-----
From: meta-arago@lists.yoctoproject.org <meta-arago@lists.yoctoproject.org>=
 On Behalf Of Nishanth Menon via lists.yoctoproject.org
Sent: Tuesday, February 22, 2022 5:06 PM
To: Eatmon, Ryan <reatmon@ti.com>
Cc: Siraswar, Yogesh <yogeshs@ti.com>; Bajjuri, Praneeth <praneeth@ti.com>;=
 Denys Dmytriyenko <denys@konsulko.com>; meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell][PATCH 3/3] Revert "linux-ti-staging: ena=
ble necessary configs for running docker containers"

On 06:38-20220211, Ryan Eatmon via lists.yoctoproject.org wrote:
> This reverts commit 628e99b8811678b4305b1175580e70ad00ec933f.
>=20
> These patches add to the size of the base image.  We have plans on=20
> reworking the images and will reapply this patch at that time.


NAK. we should'nt be dropping docker completely.


Also please signed-off-by your patches?

--
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D





