Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.10209.1645516407493861048
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 23:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Ay03/OiX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21M7rNM1022257;
	Tue, 22 Feb 2022 01:53:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645516403;
	bh=VFqJ+4zl1+xaec6MALrki5qb3JpVIvGIswRppWzQa5Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ay03/OiXKtzp56BOLgmWm+Zo5MojjEPW0fJ4nl5QLN0yU0lL0QwSSwoQDUHUJOAyr
	 ZzdajY2y1KI7EDdBDCiK6rOpZQ9dY0fNq5NhcAlUKLVxGwn9gjcephaxVgDPl0U52Q
	 xChdRwLUqMI1JiH2iIlY6asWEOEDrWegnWSNwIag=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21M7rNC3030097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Feb 2022 01:53:23 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Feb 2022 01:53:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Feb 2022 01:53:23 -0600
Received: from [10.0.2.15] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21M7rJS8075560;
	Tue, 22 Feb 2022 01:53:20 -0600
Message-ID: <4806a249-612a-2cfa-e199-1027d1f9c7b2@ti.com>
Date: Tue, 22 Feb 2022 13:23:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-arago][dunfell][PATCH] external-arm-toolchain: Remove EAT_TOOL_CHAIN symlinks
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <nikhil.nd@ti.com>, <nsekhar@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <a-m1@ti.com>
References: <20220222062027.6390-1-devarsht@ti.com>
 <20220222063656.GP26229@denix.org>
From: "Devarsh Thakkar" <devarsht@ti.com>
In-Reply-To: <20220222063656.GP26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 21M7rNM1022257
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


On 22/02/22 12:06, Denys Dmytriyenko wrote:
> NAK.

Could you please share more context for the NAK and any suggestions for
alternate solutions ?

The build is broken at the dunfell HEAD and this patch fixes below error =
:

=C2=A0INSTALL
<build_path>/arago-tmp-external-arm-glibc/work/aarch64-linux/external-arm=
-toolchain/2019.12-r0/external-arm-toolcha
in-2019.12/usr/include
mv: cannot stat
'<build_path>/build/arago-tmp-external-arm-glibc/work/aarch64-linux/exter=
nal-arm-toolchain/2019.12-r0/image/usr/lib
/gcc/aarch64-none-linux-gnu': No such file or directory

>
> On Tue, Feb 22, 2022 at 11:50:27AM +0530, Devarsh Thakkar via lists.yoc=
toproject.org wrote:
>> As per below commit in https://git.yoctoproject.org/meta-arm/log/?h=3D=
dunfell,
>>
>> "1644922 external-arm-toolchain: Align glibc packaging to OE TARGET_SY=
S"
>>
>> the upstream recipe external-arm-toolchain.bb doesn't use EAT_TARGET_S=
YS for
>> installing toolchain anymore and the recipe is directly using TARGET_S=
YS
>> for copying.
>>
>> So remove EAT_TARGET_SYS symlinks as they are not required anymore and=
 instead
>> copy directly to ORIG_TARGET_SYS.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>>  .../recipes-core/meta/external-arm-toolchain.bbappend     | 8 +------=
-
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchai=
n.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.b=
bappend
>> index 5a51aaa0..ea4df2ff 100644
>> --- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbapp=
end
>> +++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbapp=
end
>> @@ -6,12 +6,6 @@ do_install_append() {
>>  	install -d ${D}${sysconfdir}
>>  	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
>> =20
>> -	if [ ${EAT_TARGET_SYS} !=3D ${ORIG_TARGET_SYS} ]; then
>> -		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
>> -		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORI=
G_TARGET_SYS}
>> -		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TAR=
GET_SYS}
>> -		ln -sf ${ORIG_TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
>> -	fi
>> =20
>>  	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
>>  	ln -sf libgomp.so.1 ${D}${libdir}/libgomp.so
>> @@ -22,7 +16,7 @@ do_install_append() {
>>  	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
>>  	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
>> =20
>> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_=
VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_=
VER_GCC}/libgcc* ${D}${libdir}/${ORIG_TARGET_SYS}/${EAT_VER_GCC}/
>>  }
>> =20
>>  # Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS mo=
ve in ${libdir}/gcc
>> --=20
>> 2.17.1
