Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1F6EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 18:36:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.26436.1686854176760773131
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 11:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=p+KJ4O/b;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FIaD8Y019274;
	Thu, 15 Jun 2023 13:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686854173;
	bh=O6V0a8uhO/5JDnffe17xp1/Gs1pkjMuu43Bb1Ov8eCM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p+KJ4O/bawEfXK9fJ9CiczMb3e7ZuqeH6LDSSQbgEakEeUY0+UH2VrDSkthsc6tr7
	 Wrwxi13rTVuRHz9bRkODK4/xd/TUWrCaI5U3MQDPr6JbUtFjlLurXhq0ttoiXokJMN
	 VfUiShCufu926/8+RASDQpUfdxdRGC9INUeLrhHs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FIaDtg109932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 13:36:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 13:36:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 13:36:12 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FIaCsf112084;
	Thu, 15 Jun 2023 13:36:12 -0500
Message-ID: <36e0e5e8-8a80-f990-3937-0569d7d6b421@ti.com>
Date: Thu, 15 Jun 2023 13:36:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-arago][master/kirkstone][PATCH] ti-test-extras: add package
 group for large tests
Content-Language: en-US, en-US-large
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230615172807.673971-1-rs@ti.com>
 <20230615174500.GC1518@denix.org>
 <50191ceb-04f6-c4a9-e685-91b86f50f3b0@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <50191ceb-04f6-c4a9-e685-91b86f50f3b0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 35FIaD8Y019274
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jun 2023 18:36:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14640

On 6/15/23 12:47, Ryan Eatmon wrote:
> On 6/15/2023 12:45 PM, Denys Dmytriyenko wrote:
>> On Thu, Jun 15, 2023 at 12:28:07PM -0500, rs@ti.com wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> This is required for images that expect ti-test to be installed but
>>> actually use a ramdisk for primary storage. Piglit and the correspond=
ing
>>> cts tests are the real problems at the moment so we're moving those
>>> first. Other tests may follow.
>>
>> Why not make it a single packagegroup recipe producing 2 packages? Oth=
er
>> packagegroups already doing it - tisdk-matrix, tisdk-addons,=20
>> tisdk-opencl.
>=20
> In the longer term, I want to move to this.=C2=A0 But this is an "emerg=
ency"=20
> patch to try and fix a test issue for the CICD flow.=C2=A0 I'll migrate=
 this=20
> to that new style after we get a promotion.
>=20

I assumed the standard was one file per package group. If that's=20
incorrect then I'll fix it.


