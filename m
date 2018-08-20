Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 202AF52A54
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 18:27:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KIRIHZ123935
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534789638;
	bh=GFTjZbjY4W4lf3tpx5xEzDiNQN0pg+d9T6F+jfGBRI8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=aOopqu0tcdc4vVy0PW8W2tpqqfir9Gsj2wdo4SmG/H8/8BuJ/d57BDU2mFIEIeqjb
	1cC4OVY+D9RYFKIelApvDcF/sOY34Gw+F+S3i12m2/+kjV5IoAiaveFM9xqS65FDFf
	xMsg1CuPgAqPBmEdqi4XlMyZqNKLPmX7kudUSbyM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIRIpn022609
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:27:18 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 13:27:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 13:27:18 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIRHJw009416;
	Mon, 20 Aug 2018 13:27:18 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1534788584-7301-1-git-send-email-j-stiffler@ti.com>
	<20180820182439.GB29422@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <50d25157-611f-80a2-9182-499c97de1f9f@ti.com>
Date: Mon, 20 Aug 2018 14:27:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820182439.GB29422@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-core-tisdk-image: k3: add sysfw.bin to prebuilt images
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
X-List-Received-Date: Mon, 20 Aug 2018 18:27:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/20/2018 2:24 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 20, 2018 at 02:09:44PM -0400, Jacob Stiffler wrote:
>> * The sysfw.bin is required for building U-Boot for the R5
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
>> index 147f126..1f0ef1c 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
>> @@ -8,7 +8,7 @@ DEPLOY_SPL_NAME_k2e = ""
>>   DEPLOY_SPL_NAME_k2g-hs-evm = ""
>>   DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
>>   
>> -DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin"
>> +DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.bin"
> So, prebuilt ATF, OPTEE and signed SYSFW will be re-used for building U-boot
> from SDK top-level Makefile, right?

Correct.

>
>>   ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
>>   export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


