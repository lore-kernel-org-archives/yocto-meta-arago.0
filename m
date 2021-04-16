Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 860AD52B99
	for <meta-arago@arago-project.org>;
	Fri, 16 Apr 2021 22:11:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13GMBR7N112224;
	Fri, 16 Apr 2021 17:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618611087;
	bh=RxYfutJilthFHkh34W7IFpgOcvULdZVDLRi4RbHoIbU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=isuHRO+WaUKSQEyD1M61Aqv+hJbEeB8bSAVfKrZKmCVdZUH0rlcIxnO7pXHc78Cgg
	yr/2hOjSmi7ForKqwyLVTXU3c+9C3VVNUN57ZvKtG15EC7RqAaJ9udSQG5L4fGdEeh
	0QIkkGlLGVHPf4knIlKC6gMLFt4WiLET0vCFsHKM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13GMBRVi040837
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 17:11:27 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 16 Apr 2021 17:11:27 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Fri, 16 Apr 2021 17:11:27 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [dunfell/master][PATCH]
	oe-layertool-setup: Let user change parallel build options
Thread-Index: AQHXMwvnqMQk1X6VzUqnliRJ2S0Qc6q3spIQ
Date: Fri, 16 Apr 2021 22:11:27 +0000
Message-ID: <f2929faefdb04e42a15049e1d35ed672@ti.com>
References: <20210416203437.7334-1-g-tammana@ti.com>
	<20210416220018.GF15937@denix.org>
In-Reply-To: <20210416220018.GF15937@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [EXTERNAL] Re: [dunfell/master][PATCH] oe-layertool-setup: Let user change parallel build options
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
X-List-Received-Date: Fri, 16 Apr 2021 22:11:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Denys Dmytriyenko <denis@denix.org>
>Sent: Friday, April 16, 2021 5:00 PM
>To: Tammana, Gowtham <g-tammana@ti.com>
>Cc: meta-arago@arago-project.org; Bajjuri, Praneeth <praneeth@ti.com>;
>denys@konsulko.com
>Subject: [EXTERNAL] Re: [meta-arago] [dunfell/master][PATCH] oe-layertool-
>setup: Let user change parallel build options
>
>I guess this is for [oe-layersetup] project, not [dunfell/master] branch
>of
>meta-arago, recipe oe-layertool-setup :)

Oops. Will send v2.

>
>You are changing local.conf, which is user-modifiable anyway, so what's
>the
>point in making it weak here?

That is true, but this makes the option configurable per recipe basis. For
e.g. I could do below for resource heavy recipe and switch back to default
for the rest without having to change the local.conf file.

BB_NUMBER_THREADS=3D2 PARALLEL_MAKE=3D"-j 2" bitbake qtwebkit

Thanks,
Gowtham

>
>
>On Fri, Apr 16, 2021 at 03:34:37PM -0500, Gowtham Tammana wrote:
>> Change BB_NUMBER_THREADS and PARALLEL_MAKE to weak assignment so that
>> these can be changed when building recipes. Useful on machines with
>> lower resources.
>>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>
>> Changing parallel build options is the only way I can build the complete
>image
>> on my system :).
>>
>> Thanks,
>> Gowtham
>>
>>  oe-layertool-setup.sh                           | 4 ++--
>>  sample-files/local-amsdk.conf.sample            | 4 ++--
>>  sample-files/local-arago.conf.sample            | 4 ++--
>>  sample-files/local-arago64.conf.sample          | 4 ++--
>>  sample-files/local-glsdk.conf.sample            | 4 ++--
>>  sample-files/local-poky.conf.sample             | 4 ++--
>>  sample-files/local-processor-sdk-64.conf.sample | 4 ++--
>>  sample-files/local-processor-sdk.conf.sample    | 4 ++--
>>  sample-files/local.conf.sample                  | 4 ++--
>>  9 files changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>> index aa16042..df1523f 100755
>> --- a/oe-layertool-setup.sh
>> +++ b/oe-layertool-setup.sh
>> @@ -753,8 +753,8 @@ EOM
>>      # set the number of threads
>>      threads=3D`cat /proc/cpuinfo | grep -c processor`
>>      tnum=3D`expr \( ${threads} + 1 \) \* 75 / 100`
>> -    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE =3D \"-j ${tnum}\"/"
>$confdir/local.conf
>> -    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS =3D \"${tnum}\"/"
>$confdir/local.conf
>> +    sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE ?=3D \"-j ${tnum}\"/"
>$confdir/local.conf
>> +    sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS ?=3D \"${tnum}\"/"
>$confdir/local.conf
>>
>>      # Find if old DL_DIR was set
>>      if [ -e $confdir/local.conf.bak ]
>> diff --git a/sample-files/local-amsdk.conf.sample b/sample-files/local-
>amsdk.conf.sample
>> index 756286d..ac39788 100644
>> --- a/sample-files/local-amsdk.conf.sample
>> +++ b/sample-files/local-amsdk.conf.sample
>> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-
>arago.conf.sample
>> index 96dfaf9..62f0f92 100644
>> --- a/sample-files/local-arago.conf.sample
>> +++ b/sample-files/local-arago.conf.sample
>> @@ -138,12 +138,12 @@ ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> diff --git a/sample-files/local-arago64.conf.sample b/sample-
>files/local-arago64.conf.sample
>> index f48db77..68f0bff 100644
>> --- a/sample-files/local-arago64.conf.sample
>> +++ b/sample-files/local-arago64.conf.sample
>> @@ -138,12 +138,12 @@ ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> diff --git a/sample-files/local-glsdk.conf.sample b/sample-files/local-
>glsdk.conf.sample
>> index acd094f..189730a 100644
>> --- a/sample-files/local-glsdk.conf.sample
>> +++ b/sample-files/local-glsdk.conf.sample
>> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> diff --git a/sample-files/local-poky.conf.sample b/sample-files/local-
>poky.conf.sample
>> index 34b6b10..ba5d4c1 100644
>> --- a/sample-files/local-poky.conf.sample
>> +++ b/sample-files/local-poky.conf.sample
>> @@ -135,12 +135,12 @@ PATCHRESOLVE =3D "noop"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> diff --git a/sample-files/local-processor-sdk-64.conf.sample b/sample-
>files/local-processor-sdk-64.conf.sample
>> index 75e59f1..9087be9 100644
>> --- a/sample-files/local-processor-sdk-64.conf.sample
>> +++ b/sample-files/local-processor-sdk-64.conf.sample
>> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> diff --git a/sample-files/local-processor-sdk.conf.sample b/sample-
>files/local-processor-sdk.conf.sample
>> index d5af93a..59b11e6 100644
>> --- a/sample-files/local-processor-sdk.conf.sample
>> +++ b/sample-files/local-processor-sdk.conf.sample
>> @@ -135,12 +135,12 @@ ENABLE_BINARY_LOCALE_GENERATION =3D "0"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> diff --git a/sample-files/local.conf.sample b/sample-
>files/local.conf.sample
>> index d971b97..e60bedc 100644
>> --- a/sample-files/local.conf.sample
>> +++ b/sample-files/local.conf.sample
>> @@ -135,12 +135,12 @@ PATCHRESOLVE =3D "noop"
>>  # These two options control how much parallelism BitBake should use.
>The first
>>  # option determines how many tasks bitbake should run in parallel:
>>  #
>> -BB_NUMBER_THREADS =3D "1"
>> +BB_NUMBER_THREADS ?=3D "1"
>>  #
>>  # The second option controls how many processes make should run in
>parallel when
>>  # running compile tasks:
>>  #
>> -PARALLEL_MAKE =3D "-j 1"
>> +PARALLEL_MAKE ?=3D "-j 1"
>>  #
>>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D=
 "-j
>4" would
>>  # be appropriate for example
>> --
>> 2.31.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>
>
>--
>Regards,
>Denys Dmytriyenko <denis@denix.org>
>PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
>Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

