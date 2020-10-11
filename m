Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BF9E95298F
	for <meta-arago@arago-project.org>;
	Sun, 11 Oct 2020 15:25:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09BFMZP0014123;
	Sun, 11 Oct 2020 10:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602429755;
	bh=jA7QPr9SquK6w+kOiNjt6U4687D6wwGWdwAf24RZClE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Ie0ZMZ00Ru/suiQTs+H9Ajq/xVOEf34elr7kCuyZ4H3dGBLFQIh0uD2w/C+ML7tqe
	6APj1o9RrsICoPPmTlS/giaYx1wFJrnvC+E8DXzpOnh8uXYIUuVvRNHoQG1UJ9iO23
	moELYIwVZqomo9H6kmfcT4WMnFwF+VnhzowwyUCo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09BFMZu8024175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Oct 2020 10:22:35 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sun, 11 Oct 2020 10:22:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sun, 11 Oct 2020 10:22:35 -0500
Received: from [10.250.67.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09BFMYgS099598;
	Sun, 11 Oct 2020 10:22:35 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1602274359-28526-1-git-send-email-denis@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <ac29d3d9-8776-f455-b334-3116a4d790d8@ti.com>
Date: Sun, 11 Oct 2020 10:22:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602274359-28526-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell/master][PATCH] optee-os: drop code that was moved to meta-ti
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
X-List-Received-Date: Sun, 11 Oct 2020 15:25:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/9/20 3:12 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-security/optee/optee-os_git.bbappend   | 76 ----------------------
>   1 file changed, 76 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index 8694554..677c6dd 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -5,79 +5,3 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>   "
>   BRANCH = "ti-optee-os"
>   SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
> -
> -do_compile() {
> -    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
> -    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
> -        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
> -        normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
> -        mv tee.bin.signed ${B}/$normfl.optee; \
> -    )
> -
> -    if [ "${OPTEEPAGER}" = "y" ]; then
> -#        oe_runmake clean PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
> -        rm -rf out/
> -        oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR} CFG_WITH_PAGER=y
> -        ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
> -            normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
> -            mv tee.bin.signed ${B}/$normfl-pager.optee; \
> -        )
> -    fi
> -}
> -
> -do_compile_aarch64() {
> -    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
> -    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
> -        cp tee-pager_v2.bin ${B}/bl32.bin; \
> -        cp tee.elf ${B}/bl32.elf; \
> -    )
> -}
> -
> -do_compile_am65xx-hs-evm() {
> -    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
> -    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
> -        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
> -        mv tee-pager.bin.signed ${B}/bl32.bin; \
> -        cp tee.elf ${B}/bl32.elf; \
> -    )
> -}
> -
> -do_compile_j7-hs-evm() {
> -    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -    oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
> -    ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
> -        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
> -        mv tee-pager.bin.signed ${B}/bl32.bin; \
> -        cp tee.elf ${B}/bl32.elf; \
> -    )
> -}
> -
> -do_install() {
> -    #install core on boot directory
> -    install -d ${D}/boot
> -    install -m 644 ${B}/*.optee ${D}/boot || true
> -    install -m 644 ${B}/bl32.bin ${D}/boot || true
> -    install -m 644 ${B}/bl32.elf ${D}/boot || true
> -
> -    #install TA devkit
> -    install -d ${D}/usr/include/optee/export-user_ta/
> -    for f in  ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
> -        cp -aR $f ${D}/usr/include/optee/export-user_ta/
> -    done
> -}
> -
> -do_deploy() {
> -    install -d ${DEPLOYDIR}
> -    install -m 644 ${B}/*.optee ${DEPLOYDIR} || true
> -    install -m 644 ${B}/bl32.bin ${DEPLOYDIR} || true
> -    install -m 644 ${B}/bl32.elf ${DEPLOYDIR} || true
> -}
> -
> -FILES_${PN} = "/boot"
> -SYSROOT_DIRS += "/boot"
> -
> -# This is needed for bl32.elf
> -INSANE_SKIP_${PN} += "textrel"

Applied

Thanks


