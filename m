Return-Path: <dmurphy@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 767E652A3A
	for <meta-arago@arago-project.org>;
	Thu,  5 Oct 2017 17:46:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v95HkMg9016084
	for <meta-arago@arago-project.org>; Thu, 5 Oct 2017 12:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507225582;
	bh=mwGLWd6us45srOdPVX9uw9uMcX0Fz7Lu7racH+O1rvM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=qZVgl/lLGpAdXKf18l/Plf+PBlojXh1BqJn+axnGttdzhuvtJATVYe665bywZz1TJ
	CTm+2iaFLJjAyRgIGz7P9YII3TZdviBjbMmMgMwyUIHzlyR7KfgOXtnv/YKutRC73T
	1j+bUL7CNS+kXGo0slzZbcaN23KbHx4U4l8wccbY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v95HkMw9023702
	for <meta-arago@arago-project.org>; Thu, 5 Oct 2017 12:46:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 5 Oct 2017 12:46:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 5 Oct 2017 12:46:22 -0500
Received: from [172.22.139.204] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v95HkLSB024549;
	Thu, 5 Oct 2017 12:46:21 -0500
To: Denys Dmytriyenko <denys@ti.com>, "Andrew F. Davis" <afd@ti.com>
References: <20171005164138.6340-1-afd@ti.com> <20171005173201.GB16210@edge>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <914cee0d-170c-f80b-175d-bebf8230cb84@ti.com>
Date: Thu, 5 Oct 2017 12:46:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171005173201.GB16210@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee_os: Sync with upstream support for AM4 PM
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
X-List-Received-Date: Thu, 05 Oct 2017 17:46:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 10/05/2017 12:32 PM, Denys Dmytriyenko wrote:
> Thanks! Does the version change?
> 

Not yet.  Linaro will be tagging on Oct 13th to version 2.6.

Dan

> 
> On Thu, Oct 05, 2017 at 11:41:38AM -0500, Andrew F. Davis wrote:
>> Merge upstream bug fixes and new support for AM43xx power
>> management.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index f765d16a..550d75ca 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>  "
>>  BRANCH = "ti_optee_os"
>> -SRCREV = "e82ac5b65bc789f3f0d1a3668bb5a2ffe2323f77"
>> +SRCREV = "342a75f64d69fa9a60a2934d56131243d540fe42"
>>  
>>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
>> -- 
>> 2.14.1
>>


-- 
------------------
Dan Murphy

