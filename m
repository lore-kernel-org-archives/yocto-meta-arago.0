Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACE7EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 04:17:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8719.1687925864773911101
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 21:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=JLJQH7ZX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35S4HdVW075459;
	Tue, 27 Jun 2023 23:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687925859;
	bh=zLkedUZyxS22xMBPuvw5NJGyzdmpuXDoxCUPzoJDNLo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JLJQH7ZX3MLEeVao5LBxaWf2OXCI0b3z+D0VIPoFvpzSUbBJmbG95hxYPkmPJ9ZfC
	 NZpPgoXS+G8C5+V2LtISmeQ8iAoeR9QiPxovwq2QumwWWg0MYygWNposz+XS9KqVKg
	 cxCC+IijK1UfL6V1HHCtQ3kA6XPR8Zqrb/rvP0vw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35S4HdPc041785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 23:17:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 23:17:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 23:17:39 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35S4HbIi098524;
	Tue, 27 Jun 2023 23:17:37 -0500
Message-ID: <94160937-cc84-0de4-1e5f-5a4bbed2f376@ti.com>
Date: Wed, 28 Jun 2023 09:47:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v4 2/8] meta-arago-extras: sysrepo: Add
 libssh recipe needed for sysrepo
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-3-r-gunasekaran@ti.com>
 <c8e53b03-5d6d-1e74-7d06-880ee1da4f44@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <c8e53b03-5d6d-1e74-7d06-880ee1da4f44@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 35S4HdVW075459
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 04:17:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14717



On 6/27/23 8:26 PM, Andrew Davis wrote:
> On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
>> libnetconf2 is needed to build sysrepo. And libnetconf2 depends on
>> libssh. So add receipe for libssh.
>>
>=20
> What is wrong with the version of libssh already in meta-oe?

The recommended version of libssh for libnetconf2 is 0.9. [1]
While the version of libssh in meta-oe is 0.8

[1] - https://github.com/CESNET/libnetconf2

>=20
> Andrew
>=20
>> The recipe is taken as-is from the commit 09f73e7 ("update for honiste=
r")
>> from the public repo [1].
>>
>> [1] - https://github.com/sartura/meta-sysrepo
>>
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>>
>> Changes since v3:
>> ----------------
>> No change
>>
>> Changes since v2:
>> ---------------
>> Newly introduced in this series
>>
>> =C2=A0 .../recipes-sysrepo/libssh/libssh_0.9.5.bb=C2=A0=C2=A0=C2=A0 | =
35 +++++++++++++++++++
>> =C2=A0 1 file changed, 35 insertions(+)
>> =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/libssh/lib=
ssh_0.9.5.bb
>>
>> diff --git a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb =
b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
>> new file mode 100644
>> index 00000000..43a6827e
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
>> @@ -0,0 +1,35 @@
>> +SUMMARY =3D "Multiplatform C library implementing the SSHv2 and SSHv1=
 protocol"
>> +HOMEPAGE =3D "http://www.libssh.org"
>> +SECTION =3D "libs"
>> +LICENSE =3D "LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8e=
a255a0"
>> +
>> +DEPENDS =3D "zlib openssl"
>> +
>> +SRC_URI =3D "git://git.libssh.org/projects/libssh.git;branch=3Dstable=
-0.9"
>> +SRCREV =3D "0cceefd49d4d397eb21bd36e314ac87739da51ff"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit cmake
>> +
>> +PACKAGECONFIG ??=3D""
>> +PACKAGECONFIG[gssapi] =3D "-DWITH_GSSAPI=3D1, -DWITH_GSSAPI=3D0, krb5=
, "
>> +
>> +ARM_INSTRUCTION_SET:armv5 =3D "arm"
>> +
>> +EXTRA_OECMAKE =3D " \
>> +=C2=A0=C2=A0=C2=A0 -DWITH_GCRYPT=3D0 \
>> +=C2=A0=C2=A0=C2=A0 -DWITH_PCAP=3D1 \
>> +=C2=A0=C2=A0=C2=A0 -DWITH_SFTP=3D1 \
>> +=C2=A0=C2=A0=C2=A0 -DWITH_ZLIB=3D1 \
>> +=C2=A0=C2=A0=C2=A0 -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib=
', '')} \
>> +=C2=A0=C2=A0=C2=A0 "
>> +
>> +do_configure:prepend () {
>> +=C2=A0=C2=A0=C2=A0 # Disable building of examples
>> +=C2=A0=C2=A0=C2=A0 sed -i -e '/add_subdirectory(examples)/s/^/#DONOTW=
ANT/' ${S}/CMakeLists.txt \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || bbfatal "Failed to disa=
ble examples"
>> +}
>> +
>> +TOOLCHAIN =3D "gcc"

--=20
Regards,
Ravi

