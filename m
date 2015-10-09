Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7EC175299C
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 13:15:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99DFmdc007102;
	Fri, 9 Oct 2015 08:15:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99DFm2k009200;
	Fri, 9 Oct 2015 08:15:48 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 08:15:48 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99DFlFZ006387;
	Fri, 9 Oct 2015 08:15:48 -0500
Message-ID: <5617BE03.9040609@ti.com>
Date: Fri, 9 Oct 2015 09:15:47 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1444391940-2958-1-git-send-email-j-stiffler@ti.com>
	<1444391940-2958-2-git-send-email-j-stiffler@ti.com>
	<20151009131101.GH11709@denix.org>
In-Reply-To: <20151009131101.GH11709@denix.org>
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH v2 2/2] configs: Add processor-sdk-02.00.00.00-config
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
X-List-Received-Date: Fri, 09 Oct 2015 13:15:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/2015 9:11 AM, Denys Dmytriyenko wrote:
> On Fri, Oct 09, 2015 at 07:59:00AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> v2 changes:
>>    * Add "oe-layersetup" prefix
>>    * Find copies harder
> Is this a release config? Why are you switching off the release tag?

Yes, this is a release config. Are not the commit IDs preferred to tags 
since they cannot move?

>
>>   .../processor-sdk-02.00.00.00-config.txt}                          | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>   copy configs/{coresdk/coresdk-2015.01-config.txt => processor-sdk/processor-sdk-02.00.00.00-config.txt} (64%)
>>
>> diff --git a/configs/coresdk/coresdk-2015.01-config.txt b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
>> similarity index 64%
>> copy from configs/coresdk/coresdk-2015.01-config.txt
>> copy to configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
>> index 6c544d6..f43a511 100644
>> --- a/configs/coresdk/coresdk-2015.01-config.txt
>> +++ b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
>> @@ -2,11 +2,12 @@
>>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>>   
>>   bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
>> -meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.01,layers=meta-arago-distro:meta-arago-extras
>> +meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,bfc49c171cead0cf0b5d859f51c45364a74e1ea7,layers=
>> +meta-arago,git://arago-project.org/git/meta-arago.git,master,f36422977840d88696e4ea209a82b0caa37a3f5d,layers=meta-arago-distro:meta-arago-extras
>>   meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
>>   meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
>> -meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.01,layers=
>> +meta-ti,git://arago-project.org/git/meta-ti.git,fido,0a222c70845d19a2213ac36803361e8531768cca,layers=
>>   meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
>>   oe-core,git://git.openembedded.org/openembedded-core,fido,4c02a30f084408d0a6a5149937ef74520f8346dc,layers=meta
>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> -OECORELOCALCONF=./sample-files/local-arago64.conf.sample
>> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>


