Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id EBE7A52979
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 02:41:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2F2fgH4029756
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 21:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489545702;
	bh=/zbdNudmQnuVEhqKzFehzBvNPrkORrpxF81otjZ/xg8=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=gz5Y4FDUAyUANABWstsX8jLgmJ68V94IAf1bHTFSUhBOFjfGa8iOCvj1NCbZ/RbqY
	srAr8QQe1WCtovnKInCZlADEb28iamDmVP/snriGJGsM+hiuBaUwd8MDWBTANfOVJJ
	fkdsSOrdzVV+DRPWVCiSpGM0RAJIWDaM5O9/QFAY=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2F2fatT018729
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 21:41:37 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2F2fYtW001266
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 08:11:35 +0530
Received: from [172.22.218.156] (172.22.218.156) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 08:11:33 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1489491757-83601-1-git-send-email-a0393906@ti.com>
	<20170314194440.GM578@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58C8A9DD.2020803@ti.com>
Date: Wed, 15 Mar 2017 08:11:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20170314194440.GM578@edge>
X-Originating-IP: [172.22.218.156]
Cc: meta-arago@arago-project.org
Subject: Re: [master] omapdrmtest: Update tests to handle disabled HDMI
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
X-List-Received-Date: Wed, 15 Mar 2017 02:41:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Yes, this is also for morty.

On 15-Mar-17 1:14 AM, Denys Dmytriyenko wrote:
> Should this also be applied to morty, I presume?
>
> On Tue, Mar 14, 2017 at 05:12:37PM +0530, Karthik Ramanan wrote:
>> Pre-requisities: this is applicable for kernel 4.9
>>
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb              | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
>> index 793e9b5..bb787ec 100644
>> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
>> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
>> @@ -7,13 +7,14 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
>>   
>>   inherit autotools pkgconfig
>>   
>> -PR = "r19"
>> -SRCREV = "47bbb6b2ec48bbee35f9dc7192c05e48fd1a2589"
>> +PR = "r21"
>> +SRCREV = "809e72b2c5ebe45bb7ba13bcfe964b1ef69f98f0"
>>   
>>   EXTRA_OEMAKE = "CC="${CC}""
>>   TARGET_CC_ARCH += "${LDFLAGS}"
>>   
>>   SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
>> -           file://0001-configure.ac-also-check-for-libavcodec-library.patch"
>> +           file://0001-configure.ac-also-check-for-libavcodec-library.patch \
>> +"
>>   
>>   S = "${WORKDIR}/git"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


