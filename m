Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id AB4FF52978
	for <meta-arago@arago-project.org>;
	Thu, 10 May 2018 16:15:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4AGFM1v014112
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 11:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525968922;
	bh=CPBMc49jsuEQO0CKoqex29g5/dMltU904afZXhNh6rY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=v1aLbIrO/Ansx8g764Yr3R/OUcITK9gNE06Oe40jWb4lUoAmHDn5gMljqd0OoSfPD
	Lwlwq8hgOaM7QzxaaEVdj1g3gLVpEPBJN5Gc+kWBbIVx+4iRaZA6Vy9gjuy+dItUl3
	RecYmHIZQUTxIpizrkxblv9eLWRXiqGAF+p5yG/w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AGFMe2024195
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 11:15:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 10 May 2018 11:15:22 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 10 May 2018 11:15:22 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AGFLGW001991;
	Thu, 10 May 2018 11:15:22 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1525962988-28642-1-git-send-email-j-stiffler@ti.com>
	<20180510154734.GI31698@edge>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <75b90eb2-fe81-8e8a-d74c-d9c3ee915ada@ti.com>
Date: Thu, 10 May 2018 12:15:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180510154734.GI31698@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: preserve bitbake-cookerdaemon.log
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
X-List-Received-Date: Thu, 10 May 2018 16:15:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/10/2018 11:47 AM, Denys Dmytriyenko wrote:
> On Thu, May 10, 2018 at 10:36:28AM -0400, Jacob Stiffler wrote:
>> * When stdout/stderr is piped, if there is an error during parsing,
>>    all that will be printed is "Unable to start bitbake server"
>> * The bitbake-cookerdaemon.log will contain the error message, so
>>    preserve it in the LOG_DIR.
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   lib/oesdk/bitbake-test-sdk-image | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
>> index f17b594..de081cf 100644
>> --- a/lib/oesdk/bitbake-test-sdk-image
>> +++ b/lib/oesdk/bitbake-test-sdk-image
>> @@ -465,6 +465,9 @@ bitbake_sdk_images(){
>>               fi
>>           done
>>   
>> +        # Move the bitbake-cooker.log as some errors may get hidden in there.
>> +        mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log
> What happens if the file doesn't exist?

There will be an error printed and an error code returned. The error 
code is not caught, so the script will proceed.

Would you prefer to first check if the file exists, or hide the error 
code with an "mv ... || true"?

>
>>           # Only run the build testing if the status of the above builds
>>           # was "pass"
>>           if [ "$build_status" == "pass" ]
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


