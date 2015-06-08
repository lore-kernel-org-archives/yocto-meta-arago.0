Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BC6E752A99
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 18:38:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58Ic5iH006908
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:38:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58Ic4hf023406
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:38:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 13:38:04 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58Ic40d009790;
	Mon, 8 Jun 2015 13:38:04 -0500
Message-ID: <5575E10C.9080105@ti.com>
Date: Mon, 8 Jun 2015 14:38:04 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1433788340-3674-1-git-send-email-j-stiffler@ti.com>
	<20150608183551.GE32398@edge>
In-Reply-To: <20150608183551.GE32398@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] processor-sdk-daisy-config: Freeze meta-qt5 layer to stay at QT 5.4.1
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
X-List-Received-Date: Mon, 08 Jun 2015 18:38:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/8/2015 2:35 PM, Denys Dmytriyenko wrote:
> On Mon, Jun 08, 2015 at 02:32:20PM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../processor-sdk/processor-sdk-daisy-config.txt   |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/processor-sdk/processor-sdk-daisy-config.txt b/configs/processor-sdk/processor-sdk-daisy-config.txt
>> index 63a5e27..61c8a59 100644
>> --- a/configs/processor-sdk/processor-sdk-daisy-config.txt
>> +++ b/configs/processor-sdk/processor-sdk-daisy-config.txt
>> @@ -4,7 +4,7 @@
>>   bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
>>   meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
>>   meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
>> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,5ebbfedbc72452d2de18ce1557a36f3ba8b1175f,layers=
> There's one more commit after that with CLEANBROKEN - doesn't seem to affect
> us, but why not include it too?
>

This was just the commit for our last build with 5.4.1. I'll send a new 
version to get this one extra commit.

>>   meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
>>   meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
>>   meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


