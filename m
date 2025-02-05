Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFD8C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:49:58 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.13702.1738766992596405177
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 06:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=N6rt+Zni;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515EnqYB3439809
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 08:49:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738766992;
	bh=GkpquC8HW1cx/z/IvwJvYVp31O6jMXjRAWn5vbkaz4U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N6rt+ZniTeoLJm2ySkgo6WBEBIjh2TDeO2fvkWYafrv9LVArCvqnDQ6sdg1qJmPR7
	 EA3UiC6UPQce/oVO2W7GVcejO8csRTuMf8ePg1a5IHXrwLzSTbcyaIBm98Gyl/xhr3
	 YTkxzyeO08ti2ISBb8bmAmrpsvcFz8klujjL4ipI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515EnqZW114256
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 08:49:52 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 08:49:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 08:49:51 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515EnpQj107759;
	Wed, 5 Feb 2025 08:49:51 -0600
Message-ID: <2cee080e-5776-40c0-bd2d-b05f28a10d4b@ti.com>
Date: Wed, 5 Feb 2025 08:49:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v3] ti-test: Add mcrc64 test
 application
To: <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>
References: <20250204071637.4141957-1-a-limaye@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250204071637.4141957-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 14:49:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15805

On 2/4/25 1:16 AM, Aniket Limaye via lists.yoctoproject.org wrote:
> From: Udit Kumar <u-kumar1@ti.com>
> 
> Add mcrc64 test application recipe.
> This application is documented at[0].

Why?

Also the source shouldn't be here in the yocto recipe, how do you
expect the other distros we offer to make use of this?

Put it on github, or if it specifically testing some kernel interface
then maybe in the kernel source under tools/testing/crypto/ with the
other crypto userspace tests.

Andrew

> 
> [0]: https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-j722s/10_01_00_04/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/MCRC64.html
> 
> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> v3:
> * Ryan:
> - Maintain aplhabetical ordering of ti-test packages
> 
> v2:
> * Denys:
> - Add required SUMMARY variable as per https://docs.yoctoproject.org/next/contributor-guide/recipe-style-guide.html#required-variables
> ---
>   .../recipes-core/packagegroups/ti-test.bb     |   1 +
>   .../recipes-kernel/mcrc64/files/mcrc64.c      | 114 ++++++++++++++++++
>   .../recipes-kernel/mcrc64/mcrc64.bb           |  18 +++
>   3 files changed, 133 insertions(+)
>   create mode 100644 meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
>   create mode 100644 meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 814e3ea6..857e06fb 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -31,6 +31,7 @@ TI_TEST_BASE = "\
>       linuxptp \
>       lmbench \
>       lsof \
> +    mcrc64 \
>       media-ctl \
>       memtester \
>       mstpd \
> diff --git a/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
> new file mode 100644
> index 00000000..fc7a75d6
> --- /dev/null
> +++ b/meta-arago-test/recipes-kernel/mcrc64/files/mcrc64.c
> @@ -0,0 +1,114 @@
> +/*
> + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + *
> + *  Redistribution and use in source and binary forms, with or without
> + *  modification, are permitted provided that the following conditions
> + *  are met:
> + *
> + *    Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + *
> + *    Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the
> + *    distribution.
> + *
> + *    Neither the name of Texas Instruments Incorporated nor the names of
> + *    its contributors may be used to endorse or promote products derived
> + *    from this software without specific prior written permission.
> + *
> + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + *
> +*/
> +
> +#include <unistd.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/socket.h>
> +#include <linux/if_alg.h>
> +#include <string.h>
> +
> +#define BUFFER_SIZE 4096
> +#define SECTOR 4096
> +
> +int main (int argc, char **argv) {
> +
> +    int desc[2] = { -1, -1 };
> +
> +    struct sockaddr_alg sock = {
> +        .salg_family = AF_ALG,
> +        .salg_type   = "hash",
> +        .salg_name   = "crc64-iso3309"
> +    };
> +
> +    if ((desc[0] = socket(AF_ALG, SOCK_SEQPACKET, 0)) == -1 ) {
> +        perror("socket");
> +        return -1;
> +    }
> +
> +    if( bind(desc[0], (struct sockaddr *) &sock, sizeof(sock)) != 0 ) {
> +        perror("bind");
> +        return -1;
> +    }
> +
> +    if( (desc[1] = accept(desc[0], NULL, 0)) == -1 )
> +        return -1;
> +
> +    if (argc != 2 || strlen(argv[1]) == 0) {
> +        printf("Please specify filename\n");
> +        return -1; // empty string
> +    }
> +
> +    FILE* file;
> +    unsigned char *buffer;
> +    if(posix_memalign((void *)&buffer, SECTOR, BUFFER_SIZE)) {
> +        perror("posix_memalign failed");
> +        return -1;
> +    }
> +
> +    file = fopen(argv[1], "rb");
> +    if(file == NULL)
> +    {
> +        printf("An error occured while opening file: %s\n", argv[1]);
> +        free(buffer);
> +        return -1;
> +    }
> +
> +    while(!feof(file))
> +    {
> +        unsigned int count = fread(buffer, sizeof(char), BUFFER_SIZE, file);
> +        if(ferror(file))
> +        {
> +            printf("An error occurred while accessing the file: %s\n", argv[1]);
> +            fclose(file);
> +            free(buffer);
> +            return -1;
> +        }
> +
> +        if (send(desc[1], buffer, count, MSG_MORE) != count) {
> +            free(buffer);
> +            return -1;
> +        }
> +    }
> +
> +    long int crc64 = 0x0000000000000000;
> +    if(read(desc[1], &crc64, 8) != 8) {
> +        free(buffer);
> +        return -1;
> +    }
> +
> +    printf("0x%llx\n", crc64);
> +    free(buffer);
> +    return 0;
> +}
> diff --git a/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> new file mode 100644
> index 00000000..a707430d
> --- /dev/null
> +++ b/meta-arago-test/recipes-kernel/mcrc64/mcrc64.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Application to test MCRC64 driver"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://mcrc64.c;beginline=1;endline=33;md5=070547e79367134fcfdf7fdb5e3ef7e3"
> +
> +SRC_URI = "file://mcrc64.c"
> +
> +S = "${WORKDIR}/sources"
> +UNPACKDIR = "${S}"
> +
> +do_compile() {
> +	${CC} ${CFLAGS} ${LDFLAGS} ${UNPACKDIR}/mcrc64.c -o mcrc64
> +}
> +
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 0755 mcrc64 ${D}${bindir}
> +}

