Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 860C252ADE
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 18:59:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KIxT6M000752
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534791569;
	bh=nI20vo0G7buku5E0NfjQYEtbbo/KkBHPbVGYx1d4UEw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=va8ig+yNK7fAKMJ3njVhA+OIYeAZ3/PDS29e+mnHtDxFNzxsOl81/fCWIbY5yPWL1
	ajUSjpJaw9So966nE7StpBs97t3/tAcZ86N6/X6BCK1GB5nl9lPxOvYixJxF2mx4K6
	PgLmyybGOOpsVbjX8dud7V1Ex6if/piALEzwLdqQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIxTWg013829
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:59:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 13:59:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 13:59:28 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIxSKx005310;
	Mon, 20 Aug 2018 13:59:28 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
	<20180820182917.GE29422@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ebee2922-6a29-21f9-0775-075ba12f5cbe@ti.com>
Date: Mon, 20 Aug 2018 14:59:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820182917.GE29422@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC 0/3] Add secondary toolchain to devkit
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
X-List-Received-Date: Mon, 20 Aug 2018 18:59:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/20/2018 2:29 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 17, 2018 at 10:25:50AM -0400, Jacob Stiffler wrote:
>> Add a method to install a second toolchain in the devkit for situation
>> when a chip has multiple cores with different architectures.
> I actually like how minimally invasive it is. Have you tested it?

Yes. I have build-tested this for am65xx-evm and am57xx-evm, and the 
installation appears to be correct.

I also tried building U-Boot for A53 and R5 from the toolchains 
installed in a single devkit, and I do not see any problems.

>
>> Jacob Stiffler (3):
>>    external-linaro-secondary-sdk-toolchain: secondary toolchain for
>>      devkit
>>    packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
>>    arago-prefs: enable SECONDARY_TOOLCHAIN
>>
>>   meta-arago-distro/conf/distro/include/arago-prefs.inc                 | 3 +++
>>   .../recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb      | 4 ++++
>>   .../recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb   | 4 ++++
>>   3 files changed, 11 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
>>
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


