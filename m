Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by arago-project.org (Postfix) with ESMTPS id 8922C52A94
	for <meta-arago@arago-project.org>;
	Sun,  2 Oct 2016 06:19:18 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id y19so960400ybi.2
	for <meta-arago@arago-project.org>;
	Sat, 01 Oct 2016 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PK0zDJbAaaDa/LzVdxlJKl+mNJBVtrhbrXl3mbd4/4c=;
	b=zXPPaKz1Oq8qm9metyt2If8bEVapgWIi9jGBsRmu6ashuaqP8nhXYmGY2twM6fY3LK
	SxIA3i3GfZrxDmoVcnAaN9xR2vTWl0Xzt0Tsk30uLvip+cw+ThNXnYnxbK1yt1+2uJf2
	wsYGPLjXZvcDlfCiFa4ecFBb8V5EgVE7/uxS8JFfkPN6bqOjYJ1DZCIAS5hd2C7/MHbo
	tU7GwZxHR5vrvIwRuLb1p6h1ovkGrTHnvLWzjRxBRVMLWeq2HYfjGw+0ks+iQdOQ7sbt
	FpmgxnULg1/JnNiLMHMghwF5HMFvGdW1+OBR2JB2GQsU07wwtfal211ScToEKvGVRbl1
	ggLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PK0zDJbAaaDa/LzVdxlJKl+mNJBVtrhbrXl3mbd4/4c=;
	b=W+cJqOSAbzxgCZJXr6ol03yQ4GD/WSXruNO+NeeFhMDnNTmG4hYNoH7ByIFAEhDDzv
	QJPWoLgYfLGS891vQjTQbT0/Yj01WjqhQ3Y1fJJu+mN7YqlNVDS9+9WcITHFvusFFws2
	pW66BaJXaZAGsIEqxH4LontprYOwYckv0ETTsWeQtqD1eeEmEmkzd3ExQxmtRf6N3FTp
	PadWFEV94kyzQpga/G2+h00sO6DWRKV3RmgnKr7ZbVy8TPj+rcLj4zf935hwnJqlI/SX
	pbjUBHCgh4jMeas4nAfGb424U5DkuUGHvTZ8cDufQsZim9iKzj71psXFnAj1rfkO3DCa
	N+aA==
X-Gm-Message-State: AA6/9RnzkimNk/0znzYsvBJv9M+R2XDhZg2xZ0+hOsVJpSDD5SOELqybpdikaOqQID5A4CyPdJ6I72PyI87nVQ==
X-Received: by 10.37.77.137 with SMTP id a131mr10417039ybb.1.1475389158600;
	Sat, 01 Oct 2016 23:19:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.83.29.67 with HTTP; Sat, 1 Oct 2016 23:19:17 -0700 (PDT)
Received: by 10.83.29.67 with HTTP; Sat, 1 Oct 2016 23:19:17 -0700 (PDT)
In-Reply-To: <CADySD0F=F9-jO8dqxJPJJyncQYd-JSY=+MA43Riq8kvmohfPww@mail.gmail.com>
References: <CADySD0GqKG6vC=uAzRgsH4wR=UKGEpMH62pk+90GpCEG-9TqdQ@mail.gmail.com>
	<20160929202451.GN7475@edge>
	<CADySD0HngXjuunr5YfCnptqgMHhQ=CiksH47OzW5OjjRFJ1Ejg@mail.gmail.com>
	<20160930164713.GT7475@edge>
	<CADySD0H46Tixf7rDweykCTmH36+zYoKyOivfouT1SshWpYB_Vg@mail.gmail.com>
	<CADySD0F=F9-jO8dqxJPJJyncQYd-JSY=+MA43Riq8kvmohfPww@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 2 Oct 2016 19:19:17 +1300
Message-ID: <CADySD0FH8obX7edDoHbkPgDdA08_kcSSbqGTM7AKQWfs90wShg@mail.gmail.com>
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
X-List-Received-Date: Sun, 02 Oct 2016 06:19:18 -0000
Content-Type: multipart/alternative; boundary=001a113c5bc2b45104053ddbcede

--001a113c5bc2b45104053ddbcede
Content-Type: text/plain; charset=UTF-8

Hi Denys,

Since I am able to clone ti-linux-kernel.git manually, is there a way to
proceed further by copying it inside downloads dir ?
downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git ?

Regards
Ankur
On Sat, Oct 1, 2016 at 11:39 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:
> If I try using arago-daisy-config, I am able to fetch linux libc and
> linux ti staging.
>
> It looks like there is some issue with arago-krogoth-config for a fresh
setup.
> Don't know if anyone has tried it..
>
> On Sat, Oct 1, 2016 at 10:37 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:
>> I tried again after removing it but still having fetch errors..
>>
>> On Sat, Oct 1, 2016 at 5:47 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>>> Maybe your download directory got corrupted? Try removing this:
>>>
>>>
/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git
>>>
>>> --
>>> Denys
>>>
>>>
>>> On Fri, Sep 30, 2016 at 11:12:40PM +1300, Ankur Tyagi wrote:
>>>> Hi Denys,
>>>>
>>>> I am able to clone ti-linux-kernel.git (it took loooong time) which
>>>> means git.ti.com is not blocked
>>>>
>>>> ankur@at:~/arago$ git clone git://
git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>>>> Cloning into 'ti-linux-kernel'...
>>>> remote: Counting objects: 6374745, done.
>>>> remote: Compressing objects: 100% (909332/909332), done.
>>>> remote: Total 6374745 (delta 5431716), reused 6369969 (delta 5427279)
>>>> Receiving objects: 100% (6374745/6374745), 1.22 GiB | 185.00 KiB/s,
done.
>>>> Resolving deltas: 100% (5431716/5431716), done.
>>>> Checking connectivity... done.
>>>> Checking out files: 100% (52223/52223), done.
>>>>
>>>> But I still get fetch errors for linux-libc-headers and
linux-ti-staging
>>>>
>>>> regards
>>>> Ankur
>>>>
>>>> On Fri, Sep 30, 2016 at 9:24 AM, Denys Dmytriyenko <denys@ti.com>
wrote:
>>>> > Can you access this repository:
>>>> > git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>>>> >
>>>> > Try to see if you have git.ti.com blocked or require any proxy on
your side.
>>>> >
>>>> > --
>>>> > Denys
>>>> >
>>>> >
>>>> > On Fri, Sep 30, 2016 at 08:38:49AM +1300, Ankur Tyagi wrote:
>>>> >> Hi,
>>>> >>
>>>> >> I am getting fetch errors for linux-libc-headers and
linux-ti-staging.
>>>> >> I have tried removing build directory but every time I get this
error:
>>>> >>
>>>> >> ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Fetcher failure:
>>>> >> Fetch command failed with exit code 128, output:
>>>> >> Cloning into bare repository
>>>> >>
'/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
>>>> >> fatal: read error: Connection reset by peer
>>>> >> fatal: early EOF
>>>> >> fatal: index-pack failed
>>>> >>
>>>> >> ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Function failed:
>>>> >> Fetcher failure for URL:
>>>> >> 'git://
git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y
'.
>>>> >> Unable to fetch URL from any source.
>>>> >> ERROR: Logfile of failure stored in:
>>>> >>
/home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/linux-libc-headers/4.4-r0.arago0/temp/log.do_fetch.3981
>>>> >> ERROR: Task 787
>>>> >>
(/home/ankur/arago/oe-layersetup/sources/oe-core/meta/recipes-kernel/linux-libc-headers/
linux-libc-headers_4.4.bb,
>>>> >> do_fetch) failed with exit code '1'
>>>> >>
>>>> >> ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
>>>> >> do_fetch: Fetcher failure: Fetch command failed with exit code 128,
>>>> >> output:
>>>> >> Cloning into bare repository
>>>> >>
'/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
>>>> >> fatal: read error: Connection reset by peer
>>>> >> fatal: early EOF
>>>> >> fatal: index-pack failed
>>>> >>
>>>> >> ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
>>>> >> do_fetch: Function failed: Fetcher failure for URL:
>>>> >> 'git://
git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y
'.
>>>> >> Unable to fetch URL from any source.
>>>> >> ERROR: Logfile of failure stored in:
>>>> >>
/home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5/temp/log.do_fetch.4436
>>>> >> ERROR: Task 52
(/home/ankur/arago/oe-layersetup/sources/meta-ti/recipes-kernel/linux/
linux-ti-staging_4.4.bb,
>>>> >> do_fetch) failed with exit code '1'
>>>> >>
>>>> >>
>>>> >> Following is my build configuration
>>>> >>
>>>> >> BB_VERSION = "1.30.0"
>>>> >> BUILD_SYS = "x86_64-linux"
>>>> >> NATIVELSBSTRING = "Ubuntu-16.04"
>>>> >> TARGET_SYS = "arm-linux-gnueabi"
>>>> >> MACHINE = "beaglebone"
>>>> >> DISTRO = "arago"
>>>> >> DISTRO_VERSION = "2016.08"
>>>> >> TUNE_FEATURES = "arm armv7a vfp thumb neon callconvention-hard"
>>>> >> TARGET_FPU = "hard"
>>>> >> meta-arago-distro
>>>> >> meta-arago-extras =
"krogoth:8cfe40ad0264888e81f0e960a11c89eccaba4a8b"
>>>> >> meta-qt5 = "HEAD:48b4084675a15fe3fd10b58f54728dfaa2bd6c72"
>>>> >> meta-networking
>>>> >> meta-ruby
>>>> >> meta-python
>>>> >> meta-oe = "krogoth:895b25b387cae428c38990f4d2747603ee9dc92d"
>>>> >> meta-ti = "krogoth:2bbab55c0aa8bb2279d7f3cf09d99156f60befc1"
>>>> >> meta-linaro-toolchain
>>>> >> meta-optee = "krogoth:85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7"
>>>> >> meta = "krogoth:687d3b8d54aa3190bbbbc94ae2f91303fccf7c8d"
>>>> >>
>>>> >> Is there anything that I can do ?
>>>> >>
>>>> >> regards
>>>> >> Ankur
>>>> >> _______________________________________________
>>>> >> meta-arago mailing list
>>>> >> meta-arago@arago-project.org
>>>> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--001a113c5bc2b45104053ddbcede
Content-Type: text/html; charset=UTF-8

<p dir="ltr">Hi Denys,<br></p>
<p dir="ltr">Since I am able to clone ti-linux-kernel.git manually, is there a way to proceed further by copying it inside downloads dir ? downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git ?</p>
<p dir="ltr">Regards <br>
Ankur<br>
On Sat, Oct 1, 2016 at 11:39 AM, Ankur Tyagi &lt;<a href="mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt; If I try using arago-daisy-config, I am able to fetch linux libc and<br>
&gt; linux ti staging.<br>
&gt;<br>
&gt; It looks like there is some issue with arago-krogoth-config for a fresh setup.<br>
&gt; Don&#39;t know if anyone has tried it..<br>
&gt;<br>
&gt; On Sat, Oct 1, 2016 at 10:37 AM, Ankur Tyagi &lt;<a href="mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt;&gt; I tried again after removing it but still having fetch errors..<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Oct 1, 2016 at 5:47 AM, Denys Dmytriyenko &lt;<a href="mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Maybe your download directory got corrupted? Try removing this:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Denys<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Sep 30, 2016 at 11:12:40PM +1300, Ankur Tyagi wrote:<br>
&gt;&gt;&gt;&gt; Hi Denys,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I am able to clone ti-linux-kernel.git (it took loooong time) which<br>
&gt;&gt;&gt;&gt; means <a href="http://git.ti.com">git.ti.com</a> is not blocked<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ankur@at:~/arago$ git clone git://<a href="http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git">git.ti.com/ti-linux-kernel/ti-linux-kernel.git</a><br>
&gt;&gt;&gt;&gt; Cloning into &#39;ti-linux-kernel&#39;...<br>
&gt;&gt;&gt;&gt; remote: Counting objects: 6374745, done.<br>
&gt;&gt;&gt;&gt; remote: Compressing objects: 100% (909332/909332), done.<br>
&gt;&gt;&gt;&gt; remote: Total 6374745 (delta 5431716), reused 6369969 (delta 5427279)<br>
&gt;&gt;&gt;&gt; Receiving objects: 100% (6374745/6374745), 1.22 GiB | 185.00 KiB/s, done.<br>
&gt;&gt;&gt;&gt; Resolving deltas: 100% (5431716/5431716), done.<br>
&gt;&gt;&gt;&gt; Checking connectivity... done.<br>
&gt;&gt;&gt;&gt; Checking out files: 100% (52223/52223), done.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; But I still get fetch errors for linux-libc-headers and linux-ti-staging<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; regards<br>
&gt;&gt;&gt;&gt; Ankur<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Fri, Sep 30, 2016 at 9:24 AM, Denys Dmytriyenko &lt;<a href="mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; &gt; Can you access this repository:<br>
&gt;&gt;&gt;&gt; &gt; git://<a href="http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git">git.ti.com/ti-linux-kernel/ti-linux-kernel.git</a><br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Try to see if you have <a href="http://git.ti.com">git.ti.com</a> blocked or require any proxy on your side.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt;&gt; &gt; Denys<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; On Fri, Sep 30, 2016 at 08:38:49AM +1300, Ankur Tyagi wrote:<br>
&gt;&gt;&gt;&gt; &gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; I am getting fetch errors for linux-libc-headers and linux-ti-staging.<br>
&gt;&gt;&gt;&gt; &gt;&gt; I have tried removing build directory but every time I get this error:<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Fetcher failure:<br>
&gt;&gt;&gt;&gt; &gt;&gt; Fetch command failed with exit code 128, output:<br>
&gt;&gt;&gt;&gt; &gt;&gt; Cloning into bare repository<br>
&gt;&gt;&gt;&gt; &gt;&gt; &#39;/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git&#39;...<br>
&gt;&gt;&gt;&gt; &gt;&gt; fatal: read error: Connection reset by peer<br>
&gt;&gt;&gt;&gt; &gt;&gt; fatal: early EOF<br>
&gt;&gt;&gt;&gt; &gt;&gt; fatal: index-pack failed<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Function failed:<br>
&gt;&gt;&gt;&gt; &gt;&gt; Fetcher failure for URL:<br>
&gt;&gt;&gt;&gt; &gt;&gt; &#39;git://<a href="http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y">git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y</a>&#39;.<br>
&gt;&gt;&gt;&gt; &gt;&gt; Unable to fetch URL from any source.<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt;&gt;&gt; &gt;&gt; /home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/linux-libc-headers/4.4-r0.arago0/temp/log.do_fetch.3981<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: Task 787<br>
&gt;&gt;&gt;&gt; &gt;&gt; (/home/ankur/arago/oe-layersetup/sources/oe-core/meta/recipes-kernel/linux-libc-headers/<a href="http://linux-libc-headers_4.4.bb">linux-libc-headers_4.4.bb</a>,<br>
&gt;&gt;&gt;&gt; &gt;&gt; do_fetch) failed with exit code &#39;1&#39;<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5<br>
&gt;&gt;&gt;&gt; &gt;&gt; do_fetch: Fetcher failure: Fetch command failed with exit code 128,<br>
&gt;&gt;&gt;&gt; &gt;&gt; output:<br>
&gt;&gt;&gt;&gt; &gt;&gt; Cloning into bare repository<br>
&gt;&gt;&gt;&gt; &gt;&gt; &#39;/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git&#39;...<br>
&gt;&gt;&gt;&gt; &gt;&gt; fatal: read error: Connection reset by peer<br>
&gt;&gt;&gt;&gt; &gt;&gt; fatal: early EOF<br>
&gt;&gt;&gt;&gt; &gt;&gt; fatal: index-pack failed<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5<br>
&gt;&gt;&gt;&gt; &gt;&gt; do_fetch: Function failed: Fetcher failure for URL:<br>
&gt;&gt;&gt;&gt; &gt;&gt; &#39;git://<a href="http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y">git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y</a>&#39;.<br>
&gt;&gt;&gt;&gt; &gt;&gt; Unable to fetch URL from any source.<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt;&gt;&gt; &gt;&gt; /home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5/temp/log.do_fetch.4436<br>
&gt;&gt;&gt;&gt; &gt;&gt; ERROR: Task 52 (/home/ankur/arago/oe-layersetup/sources/meta-ti/recipes-kernel/linux/<a href="http://linux-ti-staging_4.4.bb">linux-ti-staging_4.4.bb</a>,<br>
&gt;&gt;&gt;&gt; &gt;&gt; do_fetch) failed with exit code &#39;1&#39;<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; Following is my build configuration<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; BB_VERSION = &quot;1.30.0&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; BUILD_SYS = &quot;x86_64-linux&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; NATIVELSBSTRING = &quot;Ubuntu-16.04&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; TARGET_SYS = &quot;arm-linux-gnueabi&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; MACHINE = &quot;beaglebone&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; DISTRO = &quot;arago&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; DISTRO_VERSION = &quot;2016.08&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; TUNE_FEATURES = &quot;arm armv7a vfp thumb neon callconvention-hard&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; TARGET_FPU = &quot;hard&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-arago-distro<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-arago-extras = &quot;krogoth:8cfe40ad0264888e81f0e960a11c89eccaba4a8b&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-qt5 = &quot;HEAD:48b4084675a15fe3fd10b58f54728dfaa2bd6c72&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-networking<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-ruby<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-python<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-oe = &quot;krogoth:895b25b387cae428c38990f4d2747603ee9dc92d&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-ti = &quot;krogoth:2bbab55c0aa8bb2279d7f3cf09d99156f60befc1&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-linaro-toolchain<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-optee = &quot;krogoth:85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta = &quot;krogoth:687d3b8d54aa3190bbbbc94ae2f91303fccf7c8d&quot;<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; Is there anything that I can do ?<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; regards<br>
&gt;&gt;&gt;&gt; &gt;&gt; Ankur<br>
&gt;&gt;&gt;&gt; &gt;&gt; _______________________________________________<br>
&gt;&gt;&gt;&gt; &gt;&gt; meta-arago mailing list<br>
&gt;&gt;&gt;&gt; &gt;&gt; <a href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br>
&gt;&gt;&gt;&gt; &gt;&gt; <a href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</p>

--001a113c5bc2b45104053ddbcede--
