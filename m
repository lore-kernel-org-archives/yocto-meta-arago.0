Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B6D64529CE
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 22:33:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJMX3rb011460
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 16:33:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJMX27L020880
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 16:33:03 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 16:33:01 -0600
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJMX1lN029514;
	Tue, 19 Nov 2013 16:33:01 -0600
Message-ID: <528BE71D.3020402@ti.com>
Date: Tue, 19 Nov 2013 17:33:01 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Chase Maupin <Chase.Maupin@ti.com>
References: <1384902810-23952-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1384902810-23952-1-git-send-email-Chase.Maupin@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] linaro-pm-qa-utils: include scripts and cpuidle binaries
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
X-List-Received-Date: Tue, 19 Nov 2013 22:33:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Carlos Hernandez <ceh@ti.com>

I will have to rework ltp-ddt test cases but this is a cleaner way to 
integrate linaro's pm-qa.git.

Thanks,
Carlos
On 11/19/2013 06:13 PM, Chase Maupin wrote:
> * Added support to build cpuidle binaries and install all of the
>    test scripts along with the binaries so that the scripts can
>    be removed from ltp-ddt
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>   .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |   44 ++++++++++++++++----
>   1 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> index 275b6e6..dcf599f 100644
> --- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> +++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> @@ -2,31 +2,59 @@ DESCRIPTION = "Utilities from Linaro for testing Power Management"
>   HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
>   
>   LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   PV = "0.4.4"
> -PR = "r0"
> +PR = "r1"
>   
>   BRANCH ?= "master"
>   SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
>   
>   SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
>   
> -S = "${WORKDIR}/git/utils"
> -
> -UTILS = "cpuburn cpucycle heat_cpu nanosleep"
> +S = "${WORKDIR}/git"
>   
>   CFLAGS += "-pthread"
>   
>   do_compile () {
> -    oe_runmake
> +    # Find all the .c files in this project and build them.  Save the names
> +    # of these files so we know which to install in the installation step.
> +    for x in `find . -name "*.c"`
> +    do
> +        util=`echo ${x} | sed s/.c$//`
> +        oe_runmake ${util}
> +    done
>   }
>   
>   do_install () {
>       install -d ${D}${bindir}
> +    install -d ${D}${bindir}/linaro-pm-qa-include
> +
> +    # Install the compiled binaries
> +    for x in `find . -name "*.c"`
> +    do
> +        util=`echo ${x} | sed s/.c$//`
> +        util_basename=`basename ${util}`
> +        install -m 0755 ${util} ${D}${bindir}/${util_basename}
> +    done
>   
> -    for util in ${UTILS}
> +    # Install the helper scripts in the include directory
> +    for script in `find . -name "*.sh" | grep include`
>       do
> -        install -m 0755 $util ${D}${bindir}/
> +        script_basename=`basename ${script}`
> +        install -m 0755 $script ${D}${bindir}/linaro-pm-qa-include/${script_basename}
> +    done
> +
> +    # Install the shell scripts NOT in the include directory since those
> +    # will be installed elsewhere
> +    for script in `find . -name "*.sh" | grep -v include`
> +    do
> +        # if the script includes any helper scripts from the include
> +        # directory then change the include path to the absolute path
> +        # and to reflect the install location of the helper scripts.
> +        sed -i -e "s#source ../include#source ${bindir}/linaro-pm-qa-include#g" ${script}
> +
> +        script_basename=`basename ${script}`
> +        install -m 0755 $script ${D}${bindir}/${script_basename}
>       done
>   }


