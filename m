Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3080452A95
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2013 19:02:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rABJ2DiC014177
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 13:02:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rABJ2Dje028608
	for <meta-arago@arago-project.org>; Mon, 11 Nov 2013 13:02:13 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 11 Nov 2013 13:02:13 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/4] linaro-pm-qa-utils: Add utils used by
	Linaro PM scripts
Thread-Index: AQHO3vh8C0DjewTzeUmvUHiSXI0YppogYSoggAAB2DA=
Date: Mon, 11 Nov 2013 19:02:12 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015980BD9E@DLEE11.ent.ti.com>
References: <1384189628-21944-1-git-send-email-Chase.Maupin@ti.com>
	<1384189628-21944-3-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C59CF32@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C59CF32@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] linaro-pm-qa-utils: Add utils used by	Linaro PM scripts
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
X-List-Received-Date: Mon, 11 Nov 2013 19:02:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>From: Cooper Jr., Franklin
>Sent: Monday, November 11, 2013 12:57 PM
>To: Maupin, Chase; meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCH 3/4] linaro-pm-qa-utils: Add
>utils used by Linaro PM scripts
>
>The patch itself is fine. Is there a plan to upstream this to
>meta-linaro?

Yeah.  I'm pinging Denys about who to work with for this.

>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Maupin, Chase
>> Sent: Monday, November 11, 2013 11:07 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH 3/4] linaro-pm-qa-utils: Add utils
>used by Linaro
>> PM scripts
>>
>> * The Linaro PM test scripts which have already been
>incorporated
>>   into the ltp-ddt project depend on some utilities from the
>>   Linaro pm-qa project.
>> * Build the utilities and install them into /usr/bin so they
>>   will be in the default PATH
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |   32
>++++++++++++++++++++
>>  1 files changed, 32 insertions(+), 0 deletions(-)  create mode
>100644 meta-
>> arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-
>utils_git.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-
>qa/linaro-pm-qa-
>> utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-
>qa/linaro-pm-qa-
>> utils_git.bb
>> new file mode 100644
>> index 0000000..275b6e6
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-
>qa-utils
>> +++ _git.bb
>> @@ -0,0 +1,32 @@
>> +DESCRIPTION =3D "Utilities from Linaro for testing Power
>Management"
>> +HOMEPAGE =3D
>>
>"https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/T
>estSui
>> te/PmQa"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D
>> "file://../COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +PV =3D "0.4.4"
>> +PR =3D "r0"
>> +
>> +BRANCH ?=3D "master"
>> +SRCREV =3D "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
>> +
>> +SRC_URI =3D "git://git.linaro.org/tools/pm-
>> qa.git;protocol=3Dgit;branch=3D${BRANCH}"
>> +
>> +S =3D "${WORKDIR}/git/utils"
>> +
>> +UTILS =3D "cpuburn cpucycle heat_cpu nanosleep"
>> +
>> +CFLAGS +=3D "-pthread"
>> +
>> +do_compile () {
>> +    oe_runmake
>> +}
>> +
>> +do_install () {
>> +    install -d ${D}${bindir}
>> +
>> +    for util in ${UTILS}
>> +    do
>> +        install -m 0755 $util ${D}${bindir}/
>> +    done
>> +}
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

