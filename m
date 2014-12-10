Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CC25F52AA0
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 20:45:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBAKjVYO015184;
	Wed, 10 Dec 2014 14:45:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBAKjVki031709;
	Wed, 10 Dec 2014 14:45:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 10 Dec 2014 14:45:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBAKjUUV004562;
	Wed, 10 Dec 2014 14:45:30 -0600
Date: Wed, 10 Dec 2014 15:45:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20141210204530.GL5113@edge>
References: <CADyYWLnXG+AeQL2OSdrjUQV9W4Q-s4qkBwa+tfRV8KWLhL-E=A@mail.gmail.com>
	<20141204225606.GG5113@edge>
	<CADyYWLkJj7Ft1dUNJkTn6Nf-r_Hgv9+Mcup6H-SdzYcS231w0Q@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C7AB423@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7AB423@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-ti-amsdk] Query regarding libgles-omap3/5.01.01.01
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
X-List-Received-Date: Wed, 10 Dec 2014 20:45:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yes, it was giving some drm-related build issues with recent kernels. But X11 
support wasn't specifically removed, it was just never tested or even used 
lately. That's what I was trying to say in the original email.

-- 
Denys


On Wed, Dec 10, 2014 at 03:22:29PM -0500, Cooper Jr., Franklin wrote:
>    X11 isn't suppose to be supported in the last Graphics package and
>    honestly I thought it hasn't been supported for several releases.
> 
>     
> 
>    http://processors.wiki.ti.com/index.php/RN_5_01_01_01#What_is_not_supported
> 
>     
> 
>    I thought it was to the point that trying to build with X11 support will
>    throw errors.
> 
>     
> 
>    From: meta-arago-bounces@arago-project.org
>    [mailto:meta-arago-bounces@arago-project.org] On Behalf Of sujith h
>    Sent: Wednesday, December 10, 2014 3:29 AM
>    To: Dmytriyenko, Denys
>    Cc: meta-arago@arago-project.org
>    Subject: Re: [meta-arago] [meta-ti-amsdk] Query regarding
>    libgles-omap3/5.01.01.01
> 
>     
> 
>     
> 
>     
> 
>    On Fri, Dec 5, 2014 at 4:26 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
>    On Tue, Dec 02, 2014 at 08:24:44PM +0530, sujith h wrote:
>    > Hi,
>    >
>    > I am using the ligbles-omap3/5.01.01.01 for core-image-sato for the
>    machine
>    > Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I got Qt5 built for
>    the
>    > machine ( taken from meta-qt5). I am not able to run opengl examples of
>    Qt5
>    > and hence as a result the examples from qtdeclarative are also failing.
>    The
>    > error I get here is:
>    >
>    > root@mel-am335x-boneblack:/usr/share/qt5/examples#
>    > ./opengl/hellowindow/hellowindow -platform xcb Qt Warning: Could not
>    find a
>    > location of the system's Compose files. Consider setting the QTCOMPOSE
>    > environment variable. Qt Warning: Could not find a location of the
>    system's
>    > Compose files. Consider setting the QTCOMPOSE environment variable. Cant
>    > find EGLConfig, returning null config Cant find EGLConfig, returning
>    null
>    > config EGL did not suggest a VisualID (EGL_NATIVE_VISUAL_ID was zero)
>    for
>    > EGLConfig 0 Unable to find an X11 visual which matches EGL config 0
>    Could
>    > not initialize EGL Aborted
>    root@mel-am335x-boneblack:/usr/share/qt5/examples#
>    >
>    >
>    > May I know if the libgles-omap3 5.01.01.01 can be used with X11 or not?
>    Or
>    > any helpers what could be wrong here? If any more inputs are needed
>    please
>    > let me know.
> 
>    X11 is supposed to be supported by 5.1.1.1 graphics stack, but it hasn't
>    been
>    tested, especially the DRM part. We've switched from Raw framebuffer use
>    case
>    directly to Wayland one in our SDK products, so no X11 exposure here.
> 
>     
> 
>    If X11 is supported in 5.1.1.1 its a good news. But I am worried if opengl
>    examples from Qt5 ( 5.3.2 version taken from
> 
>    meta-qt5 layer)  don't work, then QML won't work for the beaglebone black
>    board. Any hint or suggestions?
> 
>     
> 
>    Thanks & regards,
> 
>    Sujith H
> 
>    --
> 
>    ****************** ************************
>    Bangalore
>    <Project>Contributor to KDE project
>    http://fci.wikia.com/wiki/Anti-DRM-Campaign
>    <Blog> http://sujithh.info

