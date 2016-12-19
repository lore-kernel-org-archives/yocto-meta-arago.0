Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 8583F52AC7
	for <meta-arago@arago-project.org>;
	Mon, 19 Dec 2016 16:03:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBJG3sKs027477;
	Mon, 19 Dec 2016 10:03:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBJG3s42027314;
	Mon, 19 Dec 2016 10:03:54 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Dec 2016 10:03:54 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBJG3rEZ017863;
	Mon, 19 Dec 2016 10:03:53 -0600
To: Robert Nelson <robertcnelson@gmail.com>
References: <1482158228-14771-1-git-send-email-j-stiffler@ti.com>
	<CAOCHtYiy6pP4u7zJ=FxuMjbG9Hppb3aDA26EJ4GLmE+kwbJkEA@mail.gmail.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bc517a31-d181-e184-e0aa-214bae07a3c7@ti.com>
Date: Mon, 19 Dec 2016 11:03:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAOCHtYiy6pP4u7zJ=FxuMjbG9Hppb3aDA26EJ4GLmE+kwbJkEA@mail.gmail.com>
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] configs: add processor-sdk-03.02.00.05-config
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
X-List-Received-Date: Mon, 19 Dec 2016 16:03:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/19/2016 10:58 AM, Robert Nelson wrote:
> On Mon, Dec 19, 2016 at 8:37 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   configs/processor-sdk/processor-sdk-03.02.00.05-config.txt | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>   create mode 100644 configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
>>
>> diff --git a/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
>> new file mode 100644
>> index 0000000..71a4ad1
>> --- /dev/null
>> +++ b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
>> @@ -0,0 +1,14 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>> +
>> +bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
>> +meta-processor-sdk-internal,ssh://git@bitbucket.itg.ti.com/processor-sdk/meta-processor-sdk-internal.git,03.02.00-linux,0aaccbf7c4d22a16aeff3daf94c1b3a9c3cca541,layers=
> "internal"...
>
> git clone ssh://git@bitbucket.itg.ti.com/processor-sdk/meta-processor-sdk-internal.git
> Cloning into 'meta-processor-sdk-internal'...
> ssh: Could not resolve hostname bitbucket.itg.ti.com: Name or service not known
> fatal: Could not read from remote repository.
>
> Please make sure you have the correct access rights
> and the repository exists.

Thank you for catching this! I will send an update shortly.

>> +meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,3678d672c9c47a646897286281d4260ac4ace960,layers=
>> +meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,76381bbc10b93ffc6c014154814872b170b93796,layers=meta-arago-distro:meta-arago-extras
>> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
>> +meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
>> +meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,d8aa76970a0ba48762c631dfd79dbed49222373b,layers=
>> +meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
>> +oe-core,git://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
>> --
>> 1.9.1
> Regards,
>


