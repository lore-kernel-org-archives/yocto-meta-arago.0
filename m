Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F298ACA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 20:25:57 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.21119.1755289554166206698
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 13:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NwiXdJKM;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FKPpTm2171635;
	Fri, 15 Aug 2025 15:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755289551;
	bh=yYf6iN2BrowSxae7ARSNfnLIHPME6VQyFwtZsZNMIf4=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=NwiXdJKM2zCLFI7SW3KC3d53bbnTv+MddJEz0NKXVo6WgD0VeGvtBF8gU2d76J7Gn
	 f10vO6+NZRx/b0Rf0e1HwPqQ4paAB8/aoEyJNEb8Lx+yTLZe71R0ImDXWiFejtAkoO
	 HS0TjaNXbHjRLe3wQ2MchGFWuPi7PkKwqer+XlIM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FKPpnB2673600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 15:25:51 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 15:25:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 15:25:50 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FKPo0V1797579;
	Fri, 15 Aug 2025 15:25:50 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Aug 2025 15:25:50 -0500
Message-ID: <DC3A7RJ5NTC8.3FJ3D9WFG8J54@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <a-christidis@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <nm@ti.com>
Subject: Re: [meta-arago] [oe-layersetup][PATCH 2/2] kas: regenerate all
 configs to include bitbake
From: Randolph Sapp <rs@ti.com>
To: Jon Cormier <jcormier@criticallink.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814232955.1559040-1-rs@ti.com>
 <20250814232955.1559040-3-rs@ti.com>
 <CADL8D3YwWvVtodQehpL9aL_ytqnjOEF26JRw+KPpjFDdFmB5Og@mail.gmail.com>
 <DC37XD2JXTIN.2JYXTQ0KPHPKB@ti.com>
 <CADL8D3aDf=1M1KjeECNV7ovR8DabE3LrkC6vSR3b4nB+Xg1dFA@mail.gmail.com>
In-Reply-To: <CADL8D3aDf=1M1KjeECNV7ovR8DabE3LrkC6vSR3b4nB+Xg1dFA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 20:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16483

On Fri Aug 15, 2025 at 2:48 PM CDT, Jon Cormier wrote:
> On Fri, Aug 15, 2025 at 2:38=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>> On Fri Aug 15, 2025 at 10:25 AM CDT, Jon Cormier wrote:
>> > Is there any simple guide on using kas for the TI builds?
>> >
>> > If I try on ubuntu 24.04, what the kas documentation says, I get a
>> > very minimal and unhelpful failure... With seemingly no way to turn on
>> > additional logging.  The build directory is empty as well.
>>
>> Their documentation is enough with this patch. Prior to this patch we
>> would not
>> clone the bitbake repo, and the first part of the build is running a
>> script in
>> oe-core that is supposed to interact with bitbake. This generates the
>> cryptic
>> 'Command "/tmp/tmp_qqetik6/get_bb_env/work/build" failed with error 1'
>> error
>> message.
>>
> Makes sense, i should have read the whole patch set before commenting
>
> With kas-container, Is there a way I'm missing to specify MACHINE=3D<>
> without modifying local.conf or using "shell"?

There may be other documented options, but I personally prefer making a
top level .config.yml like the following:

```
---
header:
  version: 17
  includes:
    - kas/arago-scarthgap-config.yml

machine: am62xx-evm
target: core-image-minimal
```

> Note: The recent flutter config I guess is missing a blank line, so
> rerunning the config make generates a git diff ...
> $ git diff
> diff --git a/kas/arago-scarthgap-flutter-config.yml
> b/kas/arago-scarthgap-flutter-config.yml
> index d131a8fa5f78..e5f901bf2bb5 100644
> --- a/kas/arago-scarthgap-flutter-config.yml
> +++ b/kas/arago-scarthgap-flutter-config.yml
> @@ -76,3 +76,4 @@ repos:
>      branch: "scarthgap"
>      layers:
>        meta:
> +
>
> [snip]

Yeah, second patch addresses that. Not entirely sure how/why there was a
descrepency in whitespace to begin with. I may submit a followup patch to
address yamllint warnings that I reported a while back.

