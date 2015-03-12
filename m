Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7729652A80
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 05:51:06 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C5p4Xf019483
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 00:51:05 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C5p0ii029218
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 11:21:02 +0530
Received: from [172.24.159.122] (172.24.159.122) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 12 Mar 2015 11:21:00 +0530
Message-ID: <55012944.2040403@ti.com>
Date: Thu, 12 Mar 2015 11:21:00 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Balagopalakrishnan, Anand" <anandb@ti.com>, "Chengalvala, Vivek"
	<vchengalvala@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik"
	<karthik.ramanan@ti.com>
References: <1426074538-21653-1-git-send-email-a0393906@ti.com>
	<20150311234718.GC23587@edge>,
	<FCB36D0BED1F0D4EA8E6242507E4245B0C8827C7@DFLE08.ent.ti.com>
	<05CF4794C98B244ABDC620C10903762272FB05A7@DBDE04.ent.ti.com>
In-Reply-To: <05CF4794C98B244ABDC620C10903762272FB05A7@DBDE04.ent.ti.com>
X-Originating-IP: [172.24.159.122]
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago 1/2] packagegroup-*-graphics: Add omapdrm-pvr
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
X-List-Received-Date: Thu, 12 Mar 2015 05:51:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

All,

I think we will have to defer this particular patch for a later 
submission. The required kernel config and the SGX adaptation has to 
come in before we can make this change. This was missed out in my checks 
because I primarily validated this for J6/J6Eco.

Vivek,

You can use this patch as a reference to take it through the validation 
on the AM platforms once the required dependencies come in.

Regards
Karthik



On 12-Mar-15 11:15 AM, Balagopalakrishnan, Anand wrote:
> I believe the second message is because kernel has not been built before omapdrm-pvr.
>
> The first message is due to config_preempt. Nevertheless, the current version/recipe in meta-arago also requires config_preempt. I am not sure how the current version has been accepted.
>
> As Vivek said, I am looking at enabling SGX for config_preempt_voluntary.
>
> Regards,
> Anand
> ________________________________________
> From: Chengalvala, Vivek
> Sent: Thursday, March 12, 2015 7:19 AM
> To: Dmytriyenko, Denys; R, Karthik
> Cc: meta-arago@arago-project.org; Balagopalakrishnan, Anand
> Subject: RE: [meta-arago] [meta-arago 1/2] packagegroup-*-graphics: Add omapdrm-pvr
>
> +Anand
>
> Anand is trying to get Graphics to work with CONFIG_PREEMPT voluntary.
>
>
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Wednesday, March 11, 2015 7:47 PM
> To: R, Karthik
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-arago 1/2] packagegroup-*-graphics: Add omapdrm-pvr
>
> This doesn't work:
>
> | /home/jenkins/tisdk-build-am57x/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-oe-linux-gnueabi/omapdrm-pvr/1.9.2253347-r6c/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/osfunc.c:116:2: error: #error "A preemptible Linux kernel is required when using workqueues"
>
>
> Also I see these messages, but I don't think they are fatal:
>
> | ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.
> | /bin/sh: dos2unix: command not found
>
> --
> Denys
>
>
> On Wed, Mar 11, 2015 at 05:18:57PM +0530, Karthik Ramanan wrote:
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   .../packagegroup-arago-tisdk-graphics.bb           |    3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
>> index f854596..1043ce5 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
>> @@ -38,9 +38,8 @@ GRAPHICS_RDEPENDS_omap3 = "\
>>   GRAPHICS_RDEPENDS_omap-a15 = "\
>>       libgbm \
>>       omap5-sgx-ddk-um-linux \
>> +    omapdrm-pvr \
>>       "
>> -# Put this back when compile issues are fixed against 3.14
>> -#    omapdrm-pvr
>>
>>   GRAPHICS_BLTSVILLE = ""
>>   GRAPHICS_BLTSVILLE_omap-a15 = " \
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>


