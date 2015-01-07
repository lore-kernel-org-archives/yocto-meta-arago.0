Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 06364529E0
	for <meta-arago@arago-project.org>;
	Wed,  7 Jan 2015 12:15:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t07CFs5W001278
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 06:15:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t07CFsW6020802
	for <meta-arago@arago-project.org>; Wed, 7 Jan 2015 06:15:54 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 7 Jan 2015 06:15:54 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-tisdk-multimedia:
	Remove dspdce-fw from dra7xx-evm.
Thread-Index: AQHQKcCGrXoc2xLroUKaGL8oN0nFs5yzy4sAgACZzQCAAC2wIA==
Date: Wed, 7 Jan 2015 12:15:53 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140D1B9A@DFLE09.ent.ti.com>
References: <1420556002-20165-1-git-send-email-j-stiffler@ti.com>
	<20150106181856.GY4759@edge> <54ACA814.7040105@ti.com>
In-Reply-To: <54ACA814.7040105@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-tisdk-multimedia: Remove dspdce-fw from dra7xx-evm.
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
X-List-Received-Date: Wed, 07 Jan 2015 12:15:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Karthik,

Both "opencl" and "dspdce-fw" supply DSP firmware (i.e. "/lib/firmware/dra7=
-dsp1-fw.xe66").

Does MM use the DSP on dra7xx-evm? We have not seen any issues in our testi=
ng.

Thanks,
Jake

-----Original Message-----
From: R, Karthik=20
Sent: Tuesday, January 06, 2015 10:29 PM
To: Stiffler, Jacob
Cc: Dmytriyenko, Denys; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] packagegroup-arago-tisdk-multimedia: Remo=
ve dspdce-fw from dra7xx-evm.

Jake,


On 06-Jan-15 11:48 PM, Denys Dmytriyenko wrote:
> So, this will break MM for dra7xx-evm, but we still don't have OpenCL=20
> enabled by default. Should this be more conditional, if both of those can=
't co-exist?

>
>
> On Tue, Jan 06, 2015 at 09:53:22AM -0500, Jacob Stiffler wrote:
>> * This is to avoid conflict with OpenCL firmware.
>>

Could you please give more details about the conflict with OpenCL firmware?

Regards
Karthik

>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../packagegroup-arago-tisdk-multimedia.bb         |    3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis
>> dk-multimedia.bb=20
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis
>> dk-multimedia.bb
>> index 81d5ee1..c51a02c 100644
>> ---=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis
>> dk-multimedia.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago
>> +++ -tisdk-multimedia.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION =3D "Task to add multimedia related packages"
>>   LICENSE =3D "MIT"
>> -PR =3D "r10"
>> +PR =3D "r11"
>>
>>   inherit packagegroup
>>
>> @@ -49,7 +49,6 @@ ACCEL_FW_append_omap5-evm =3D " \
>>
>>   ACCEL_FW_append_dra7xx-evm =3D " \
>>       ${@base_contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
>> -    dspdce-fw \
>>       vis \
>>       "
>>
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


