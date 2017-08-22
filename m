Return-Path: <dmurphy@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EA3505299D
	for <meta-arago@arago-project.org>;
	Tue, 22 Aug 2017 19:27:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7MJRG0w015811
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 14:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503430036;
	bh=vTyxYrONi6SQYOG6XL2rcuPjJKi7Sezc+6RspkwJtnw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=DaS26ynJrXd3q6CzQbBgjrRE6BLlkyxI+h5ehO9kVzTuXak9It5/BF2gfltj2ltEi
	quc4GD9n8ks/ATu4NhR6qC9qaJT1OpjARYuTY9h9aa2Z40BlqH2lY+vguWvC+JkFNP
	zxOgdMzVi5JL8nTVTBkniKY61DEGd3qBcj68/IXI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MJRGGS022178
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 14:27:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 22 Aug 2017 14:27:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 22 Aug 2017 14:27:16 -0500
Received: from [172.22.147.66] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MJRGZL030581;
	Tue, 22 Aug 2017 14:27:16 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20170822184341.15304-1-dmurphy@ti.com>
	<20170822191914.GM28233@edge>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <a0fb89fc-a64d-a608-abd2-6d3662771aaf@ti.com>
Date: Tue, 22 Aug 2017 14:27:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170822191914.GM28233@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee_os: Add Secure Device Playback memory reservation
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
X-List-Received-Date: Tue, 22 Aug 2017 19:27:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 08/22/2017 02:19 PM, Denys Dmytriyenko wrote:
> Thanks!
> 
> On Tue, Aug 22, 2017 at 01:43:41PM -0500, Dan Murphy wrote:
>> Add Secure Device Playblack firewall memory reservation
> 
> Playblack? :)
> 

Oops.  Did you want a v2 or are you going to fix it up?

Dan

> 
>> and enable SDP feature in OPTEE_OS
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index 07eb088e..f765d16a 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>  "
>>  BRANCH = "ti_optee_os"
>> -SRCREV = "09fe6fe9099d4479ab6e986f4af78dd9f9215862"
>> +SRCREV = "e82ac5b65bc789f3f0d1a3668bb5a2ffe2323f77"
>>  
>>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
>> -- 
>> 2.14.0
>>


-- 
------------------
Dan Murphy

