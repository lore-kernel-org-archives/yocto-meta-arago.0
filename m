Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0E815529A9
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2019 11:25:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FBOWIZ109380
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2019 06:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571138672;
	bh=Am7kyfkGS7Oygspthk0MaWOMC08tEY4cHJDYl/ddGkw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=BRD+A8qLct63GBvs3yn9jYQnPTkAOIQcEOuXqxjamUMoCuEmvUq0LKJh4m0H6poph
	O/DRgzFX0/+V3tBXRe2Y4XxkdJFbWQWCj1M4ClAEXtcjSpF2XPZTigofRAaoqm0tZi
	KzF1ue0D8IZ48+B9I90MIqnY0s3UWeOkoUM8qjYg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9FBOWDL085948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2019 06:24:32 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 15 Oct 2019 06:24:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 15 Oct 2019 06:24:32 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FBOVXi071730;
	Tue, 15 Oct 2019 06:24:31 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <a0132237@ti.com>
References: <1d7507c5-ffa0-eeec-3575-5e42f1d14473@ti.com>
	<20191015030223.GH14271@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f85343e9-0017-b98d-d7b4-68dba7b85063@ti.com>
Date: Tue, 15 Oct 2019 07:24:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015030223.GH14271@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: KERNEL_DEVICETREE_append in custom layer does not take effect in ti-tisdk-makefile
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
X-List-Received-Date: Tue, 15 Oct 2019 11:25:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10/14/2019 11:02 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 14, 2019 at 05:58:50PM +0530, Nikhil Devshatwar wrote:
>> Hi Denys/Jacob,
>>
>> I am appending the KERNEL_DEVICETREE variable in the  meta-psdkla layer
>> linux-ti-staging_%.bbappend recipe
> Nikhil,
>
> You are appending the variable in a recipe - it will have the scope of that
> recipe only.
>
>
>> All the additional DTB files get built correctly but the ti-tisdk-makefile
>> recipe cannot replace the Makefile with the updated variable.
>>
>> Instead, it replaces the Makefile with old value of KERNEL_DEVICETREE
>>
>> How is this happening? Can you please help me with how to achieve the same?
> In order to change the variable to affect all the recipes, you have to do it
> in one of the global config files.

We have been adding these in our branding file. See 
http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=blob;f=conf/distro/include/branding-processor-sdk.inc;h=b28e452119b4eb735d053d148f0d4faf7ff9da61;hb=HEAD#l35



