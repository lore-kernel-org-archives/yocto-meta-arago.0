Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by arago-project.org (Postfix) with ESMTPS id E924D52975
	for <meta-arago@arago-project.org>;
	Fri, 30 Sep 2016 10:13:00 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id t67so65559904ywg.3
	for <meta-arago@arago-project.org>;
	Fri, 30 Sep 2016 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LfvhPSwzcBJWo04hGEAA+q29g8+o4P0DAlZMD7jCoSg=;
	b=yRHC3jBjV8DkpLQzy3oH7HdPcOdLZFoJgbu9MM+bQpH4vraMhTiDHfIIEnjhp3ricY
	hZhocmNmmv5zbKBTJU+bLTX2sQLhK8An22hRudGzHPRY8VsFYAUW7kdbLGoeLYX2bUhD
	Qo19cjjINvJXnyZPMzrqyIrZmzHlzGYFgMt26vdK+5PQjB+ilK2gwW9wQLB9QMx8f6d7
	36QCCeHePIYvhA3MJf7j/DWuYAC380MfxZfXWb7E1S/mt2JTXyy1vQIpbSR5H5BJjISN
	gFbys5RKhw1VYssd6sh7y6K4DR9MfY74gnUt/dmHPQYAdHkhVZJzS4HkLxw3HsFr7oHw
	xC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LfvhPSwzcBJWo04hGEAA+q29g8+o4P0DAlZMD7jCoSg=;
	b=buhrsP3e4v3Y9BjvxhAGdrJ/pSB8GJz3Rs/btcvEM9cBSyeuWFP96PZnh+HzD63+zH
	xixogH/LuYhzcem7oACBhssAU7vcr4pJPiE3z0pKMxf9AcyrWKm93U6i6WJ0vDvN0cwO
	8prtQ5qbGiqTpNI02/VSWFjaBYk/E9BALBDfybO67iKa1K46nLr2UWaVZUotk5MgEIqj
	wXAbFSlbFxl6+eMbyR5m/+7Z1cK1mw2s9fcI9j1s87bLeP8DHWsxzLvfdKouW6ZoWFMu
	YT+NRa9iaaizUTt62008hAtSv1a0duIFxHyprZ3Ktg4ktxuhMNgFXXHIeAmsLIpJVX7b
	dh8w==
X-Gm-Message-State: AA6/9Rl6Spa4aLlS1JXKpJRb5ItaKNfRpU9D9fOH8ffuJRzFez4f/Hhi+r12vIOWmuOMNkSHxKEjer1UMg1rkg==
X-Received: by 10.13.195.66 with SMTP id f63mr3826005ywd.238.1475230380943;
	Fri, 30 Sep 2016 03:13:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.83.6.14 with HTTP; Fri, 30 Sep 2016 03:12:40 -0700 (PDT)
In-Reply-To: <20160929202451.GN7475@edge>
References: <CADySD0GqKG6vC=uAzRgsH4wR=UKGEpMH62pk+90GpCEG-9TqdQ@mail.gmail.com>
	<20160929202451.GN7475@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 30 Sep 2016 23:12:40 +1300
Message-ID: <CADySD0HngXjuunr5YfCnptqgMHhQ=CiksH47OzW5OjjRFJ1Ejg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: linux-libc-headers and linux-ti-staging fetch errors
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
X-List-Received-Date: Fri, 30 Sep 2016 10:13:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi Denys,

I am able to clone ti-linux-kernel.git (it took loooong time) which
means git.ti.com is not blocked

ankur@at:~/arago$ git clone git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
Cloning into 'ti-linux-kernel'...
remote: Counting objects: 6374745, done.
remote: Compressing objects: 100% (909332/909332), done.
remote: Total 6374745 (delta 5431716), reused 6369969 (delta 5427279)
Receiving objects: 100% (6374745/6374745), 1.22 GiB | 185.00 KiB/s, done.
Resolving deltas: 100% (5431716/5431716), done.
Checking connectivity... done.
Checking out files: 100% (52223/52223), done.

But I still get fetch errors for linux-libc-headers and linux-ti-staging

regards
Ankur

On Fri, Sep 30, 2016 at 9:24 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> Can you access this repository:
> git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>
> Try to see if you have git.ti.com blocked or require any proxy on your side.
>
> --
> Denys
>
>
> On Fri, Sep 30, 2016 at 08:38:49AM +1300, Ankur Tyagi wrote:
>> Hi,
>>
>> I am getting fetch errors for linux-libc-headers and linux-ti-staging.
>> I have tried removing build directory but every time I get this error:
>>
>> ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Fetcher failure:
>> Fetch command failed with exit code 128, output:
>> Cloning into bare repository
>> '/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
>> fatal: read error: Connection reset by peer
>> fatal: early EOF
>> fatal: index-pack failed
>>
>> ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Function failed:
>> Fetcher failure for URL:
>> 'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y'.
>> Unable to fetch URL from any source.
>> ERROR: Logfile of failure stored in:
>> /home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/linux-libc-headers/4.4-r0.arago0/temp/log.do_fetch.3981
>> ERROR: Task 787
>> (/home/ankur/arago/oe-layersetup/sources/oe-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb,
>> do_fetch) failed with exit code '1'
>>
>> ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
>> do_fetch: Fetcher failure: Fetch command failed with exit code 128,
>> output:
>> Cloning into bare repository
>> '/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
>> fatal: read error: Connection reset by peer
>> fatal: early EOF
>> fatal: index-pack failed
>>
>> ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
>> do_fetch: Function failed: Fetcher failure for URL:
>> 'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y'.
>> Unable to fetch URL from any source.
>> ERROR: Logfile of failure stored in:
>> /home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5/temp/log.do_fetch.4436
>> ERROR: Task 52 (/home/ankur/arago/oe-layersetup/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_4.4.bb,
>> do_fetch) failed with exit code '1'
>>
>>
>> Following is my build configuration
>>
>> BB_VERSION        = "1.30.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-16.04"
>> TARGET_SYS        = "arm-linux-gnueabi"
>> MACHINE           = "beaglebone"
>> DISTRO            = "arago"
>> DISTRO_VERSION    = "2016.08"
>> TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
>> TARGET_FPU        = "hard"
>> meta-arago-distro
>> meta-arago-extras = "krogoth:8cfe40ad0264888e81f0e960a11c89eccaba4a8b"
>> meta-qt5          = "HEAD:48b4084675a15fe3fd10b58f54728dfaa2bd6c72"
>> meta-networking
>> meta-ruby
>> meta-python
>> meta-oe           = "krogoth:895b25b387cae428c38990f4d2747603ee9dc92d"
>> meta-ti           = "krogoth:2bbab55c0aa8bb2279d7f3cf09d99156f60befc1"
>> meta-linaro-toolchain
>> meta-optee        = "krogoth:85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7"
>> meta              = "krogoth:687d3b8d54aa3190bbbbc94ae2f91303fccf7c8d"
>>
>> Is there anything that I can do ?
>>
>> regards
>> Ankur
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

