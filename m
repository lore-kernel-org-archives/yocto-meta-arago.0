Return-Path: <robertcnelson@gmail.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by arago-project.org (Postfix) with ESMTPS id E4BA952998
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2018 20:52:10 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id r8-v6so6175000ljc.10
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2018 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=14NUn16nfTcIXg5qGm0EgiWaVHRmRw7hbtbsRHprrCA=;
	b=Rh2KXghojorf+LazxzyWct2+qNgU1mQjBjW1N7viOu8Kv2yOU6APam/khKYaOsMq94
	+ZwKwGsOMdagDl2F8asbilpmcb3uLQMyRHVxmeJyIVG5Im/Ll2tGHsgj0R0sVJ1TSVwH
	QsZ1z2mAPjZppFbEbh7pJRMnQvYsZH44vH0ofGWDg1He8BXR2gmV5qZwMLJ5X5CTXZlC
	8ctgv32S52c8wq0qmSt/hDrwmIf4e/sdkcQpgdjBax/oDmNgZglXLv6iyqvk7wRoNIBX
	xUJBY636Bwakr5LgMbupMY/QgTRItq6aA/e6R6O/kjyTZX+/Y2SPXKvAN067NCTicn+e
	146g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=14NUn16nfTcIXg5qGm0EgiWaVHRmRw7hbtbsRHprrCA=;
	b=X1sFLqACjS9RQBApI842tZHfsLKsgiUay/ZmMCNSB/jBoZi4lVBahSi/K25KPK45Dq
	GEyiJZSyEP/vrxWy8BEO2FIZR4ka1tHO0HSMjmY7qoVUentbetF1jFG4EgqWsyJLBotv
	fSTXcjBXi6I+wguXtmL9Z1Q31/6t74UN2WCyXSA5ANHITjjUo0SxZuDwbC3NaPKRLQW9
	J2DasTfatQ9jBzJ7zVFXLIkznV2AkDBMN1GYCw3mylJM5T2EDNrYLfyih++mTZbYksXY
	pni3BT2YkCE37jZ94BYVmX5e+/WAf18itq1tL2Aw6kKnWWgTOFldRyUn/Xel53w88vf1
	bFNg==
X-Gm-Message-State: ABuFfohJT61crP/ut2wJ/kaz92yzkpCVKBpWEqzBLCOKKKv2LFaqONEz
	ptj99AZozXMTr8yTee73TDD7SsjUcb5BFtaHZRE=
X-Google-Smtp-Source: ACcGV61oL31S0tKCEh8pGFvUfZfU4ghXow9gzhTOszAn6mhzpl01QTv4NkGqtX7TECnr1nPJMIAt0RcjKkNwMVopiFc=
X-Received: by 2002:a2e:7608:: with SMTP id
	r8-v6mr12431809ljc.175.1539204721185; 
	Wed, 10 Oct 2018 13:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <1539094175-32270-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1539094175-32270-1-git-send-email-j-stiffler@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 10 Oct 2018 15:51:34 -0500
Message-ID: <CAOCHtYhAzLGmOK9CQDuNS9_cvCZgiNvwH498N5Z2xx4OHJyUZQ@mail.gmail.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Cc: meta-arago@arago-project.org, Jason Kridner <jdk@ti.com>
Subject: Re: [oe-layersetup][PATCH] processor-sdk: add 5.1.0.11 release config
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
X-List-Received-Date: Wed, 10 Oct 2018 20:52:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 9, 2018 at 9:09 AM Jacob Stiffler <j-stiffler@ti.com> wrote:
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../processor-sdk/processor-sdk-05.01.00.11-config.txt    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
>
> diff --git a/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
> new file mode 100644
> index 0000000..33c29d9
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
> @@ -0,0 +1,15 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
> +meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,012bf1c42b1826380ca7557e5185fe88f939a93c,layers=
> +meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
> +meta-arago,http://arago-project.org/git/meta-arago.git,ti2018.03,85f191c83f7cd7b3b4fb6df08b22fabe24e25773,layers=meta-arago-distro:meta-arago-extras
> +meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
> +meta-ti,git://git.yoctoproject.org/meta-ti,ti2018.03,3f26d1f94fbc87740fdfe33292c904e865257e81,layers=
> +meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
> +oe-core,git://git.openembedded.org/openembedded-core,rocko,7d518d342eb67d25aa071fb08d03f06d6da576c6,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> --
> 1.9.1

Hi Jacob,

For BeagleBoard.org, we built this so we could get the OpenCL firmware
bits, however the 05.01.00.11 tag seem's to have a problem.

TOOLCHAIN_PATH=/var/lib/jenkins/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf
MACHINE=am57xx-evm bitbake opencl-monitor ipumm-fw vpdma-fw cmem-mod
tidl-api tidl-examples

15:20:30 | INTERNAL ERROR:
/var/lib/jenkins/jobs/ti-sdk-05.01.00.11/workspace/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/opencl-monitor/1.1.16.01-r0.0/recipe-sysroot-native/usr/share/ti/cgt-c6x/bin/cg6x3
experienced a segmentation fault
15:20:30 |                   while processing function _Z7shuffleDv16_mDv16_t
15:20:30 |
15:20:30 | This is caused by a defect in the TI C/C++ Codegen.
15:20:30 | TI Customer Support may be able to suggest a workaround to
avoid this.
15:20:30 |
15:20:30 | Upgrading to the newest version of the compiler may fix this problem.
15:20:30 |
15:20:30 | Contact TI in the E2E support forums at http://e2e.ti.com under
15:20:30 | "Development Tools", "TI C/C++ Compiler".  See the link titled
15:20:30 | "Submitting an issue".
15:20:30 |
15:20:30 | We need to see this ENTIRE error message and a complete, reproducable
15:20:30 | test case including ALL of the command-line options.
15:20:30 | Include the .pp file created by option --preproc_with_comment
15:20:30 |
15:20:30 |
15:20:30 | >> Compilation failure
15:20:30 | Makefile:52: recipe for target 'shuffle.obj' failed
15:20:30 | make[2]: *** [shuffle.obj] Error 1
15:20:30 | make[2]: *** Waiting for unfinished jobs....
15:20:30 | rm modf.bc all.bc any.bc shuffle.bc smoothstep.bc rotate.bc
abs.bc cross.bc mul_hi.bc mad_sat.bc sincos.bc hadd.bc lgamma_r.bc
convert_round.bc select.bc remquo.bc clamp.bc frexp.bc relationals.bc
misc.bc max.bc step.bc sub_sat.bc degrees.bc add_sat.bc abs_diff.bc
atomics.bc sign.bc clz.bc upsample.bc math.bc length.bc convert.bc
mix.bc bitselect.bc fract.bc half.bc
15:20:30 | make[2]: Leaving directory
'/var/lib/jenkins/jobs/ti-sdk-05.01.00.11/workspace/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/opencl-monitor/1.1.16.01-r0.0/git/builtins'
15:20:30 | Makefile.am57x:127: recipe for target '../builtins/dsp.lib' failed
15:20:30 | make[1]: Leaving directory
'/var/lib/jenkins/jobs/ti-sdk-05.01.00.11/workspace/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/opencl-monitor/1.1.16.01-r0.0/git/monitor'
15:20:30 | make[1]: *** [../builtins/dsp.lib] Error 2
15:20:30 | CMake Error at cmake_install.cmake:48 (file):
15:20:30 |   file INSTALL cannot find
15:20:30 |   "/var/lib/jenkins/jobs/ti-sdk-05.01.00.11/workspace/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/opencl-monitor/1.1.16.01-r0.0/git/monitor/monitor_am57x/dsp0.syms".
15:20:30 |
15:20:30 |
15:20:30 | Makefile:120: recipe for target 'install' failed
15:20:30 | make: *** [install] Error 1

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

