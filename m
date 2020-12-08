Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 5DA1452988
	for <meta-arago@arago-project.org>;
	Tue,  8 Dec 2020 20:33:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8KXkH7114015;
	Tue, 8 Dec 2020 14:33:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607459626;
	bh=QUBeYIWt8+pEjpXxDpwVH/3pPk8FhWO5nQ7PZ5KJ7Qg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=vylyXUciCrvjJvqUDBCWV9Y2nWsLl03xyEcBuLuAecHTVO9HCGtJd0JyRWCf4+Vp7
	J9Ct8i9FWTg4A7L/02yBwSJJEx/BTc+4DC75SIQ+VAyPF1ckd5MGdG0qQNhJop9xG3
	jfdS9jccQdq9BdAimXEMfdOn+ccEBsuFonVNOe8I=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8KXko1094465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Dec 2020 14:33:46 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 8 Dec 2020 14:33:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 8 Dec 2020 14:33:45 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8KXjl1003020;
	Tue, 8 Dec 2020 14:33:46 -0600
To: Denys Dmytriyenko <denis@denix.org>
References: <20201208193742.27071-1-dmurphy@ti.com>
	<20201208202442.GY19155@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c4ee7d04-0564-9512-873b-481561185755@ti.com>
Date: Tue, 8 Dec 2020 14:33:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208202442.GY19155@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master] [PATCH] external-arm-toolchain: Remove recipe in favor of upstream
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
X-List-Received-Date: Tue, 08 Dec 2020 20:33:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

Thanks for the guidance.

I gave the sdk recipe a quick look and that is still needed for the 
cross-canadian as that was not pulled into upstream.

But I need to dig a bit deeper into that recipe.

So far removing this recipe has allowed the builds to pass for the 
toolchain.

Dan

On 12/8/20 2:24 PM, Denys Dmytriyenko wrote:
> Dan,
>
> You might want to look into eventually removing external-arm-sdk-toolchain as
> well.
>
> But I would also suggest doing lots of testing of these changes, especially
> when packaging the toolchain for the target and SDK/devkit. As there were some
> adjustments made when upstreaming these recipes to meta-arm earlier, so the
> code there is not 100% identical and some assumptions in meta-arago may no
> longer be true.
>
> Please let me know if you have any questions - I'd be happy to help where I
> can.
>
> Thanks.
>
> Denys
>
>
> On Tue, Dec 08, 2020 at 01:37:42PM -0600, Dan Murphy wrote:
>> The upstream branch has been updated with the contents of this recipe
>> and this bbappend is no longer needed.
>>
>> Commit 0078d68b46bce3197ef54d47b19bb83caf0acdb7 up to and including
>> commit 316d9318ee56dc1769144507e8ae529b8041ef3 in the meta-arm layer.
>>
>> See repo
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/log/?h=dunfell
>>
>> From: Dan Murphy <dmurphy@ti.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../meta/external-arm-toolchain.bbappend      | 73 -------------------
>>   1 file changed, 73 deletions(-)
>>   delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
>>
>> diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
>> deleted file mode 100644
>> index 5a51aaa07428..000000000000
>> --- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
>> +++ /dev/null
>> @@ -1,73 +0,0 @@
>> -ORIG_TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
>> -
>> -do_install_append() {
>> -	install -d ${D}${base_sbindir}
>> -	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/libc/${base_sbindir}/ldconfig ${D}${base_sbindir}/
>> -	install -d ${D}${sysconfdir}
>> -	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
>> -
>> -	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
>> -		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
>> -		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_TARGET_SYS}
>> -		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET_SYS}
>> -		ln -sf ${ORIG_TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
>> -	fi
>> -
>> -	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
>> -	ln -sf libgomp.so.1 ${D}${libdir}/libgomp.so
>> -	ln -sf libitm.so.1 ${D}${libdir}/libitm.so
>> -	ln -sf libssp.so.0 ${D}${libdir}/libssp.so
>> -	ln -sf libstdc++.so.6 ${D}${libdir}/libstdc++.so
>> -	ln -sf libubsan.so.1 ${D}${libdir}/libubsan.so
>> -	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
>> -	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
>> -
>> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>> -}
>> -
>> -# Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move in ${libdir}/gcc
>> -# to enable native compile on the target
>> -FILES_libgcov-staticdev = "${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libgcov.a"
>> -
>> -FILES_libgfortran-dev = "\
>> -    ${libdir}/libgfortran*.so \
>> -    ${libdir}/libgfortran.spec \
>> -    ${libdir}/libgfortran.la \
>> -    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libgfortranbegin.* \
>> -    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/libcaf_single* \
>> -    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/finclude/ \
>> -"
>> -
>> -FILES_gcc-sanitizers = "${libdir}/*.spec ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/sanitizer/*.h"
>> -
>> -# This is provided by gcc:
>> -#    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include
>> -FILES_libgcc-dev = "\
>> -    ${base_libdir}/libgcc*.so \
>> -    ${@oe.utils.conditional('BASETARGET_SYS', '${ORIG_TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
>> -    ${libdir}/${TARGET_SYS}/${BINV}* \
>> -    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
>> -    ${libdir}/gcc/${TARGET_SYS} \
>> -"
>> -
>> -FILES_libssp-dev = "\
>> -    ${libdir}/libssp*.so \
>> -    ${libdir}/libssp*_nonshared.a \
>> -    ${libdir}/libssp*.la \
>> -    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/ssp \
>> -"
>> -
>> -FILES_libquadmath-dev = "\
>> -    ${libdir}/libquadmath*.so \
>> -    ${libdir}/libquadmath.la \
>> -    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/quadmath* \
>> -"
>> -
>> -FILES_libgomp-dev = "\
>> -    ${libdir}/libgomp*${SOLIBSDEV} \
>> -    ${libdir}/libgomp*.la \
>> -    ${libdir}/libgomp.spec \
>> -    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/omp.h \
>> -"
>> -
>> -INSANE_SKIP_libgcc-dev += "staticdev"
>> -- 
>> 2.29.2
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>

