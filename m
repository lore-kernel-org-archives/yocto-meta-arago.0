Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D2F80529DD
	for <meta-arago@arago-project.org>;
	Thu,  4 Dec 2014 22:56:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB4Mu84X023296;
	Thu, 4 Dec 2014 16:56:08 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4Mu8Js020801;
	Thu, 4 Dec 2014 16:56:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Dec 2014 16:56:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB4Mu7fV030677;
	Thu, 4 Dec 2014 16:56:07 -0600
Date: Thu, 4 Dec 2014 17:56:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: sujith h <sujith.h@gmail.com>
Message-ID: <20141204225606.GG5113@edge>
References: <CADyYWLnXG+AeQL2OSdrjUQV9W4Q-s4qkBwa+tfRV8KWLhL-E=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADyYWLnXG+AeQL2OSdrjUQV9W4Q-s4qkBwa+tfRV8KWLhL-E=A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 04 Dec 2014 22:56:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 02, 2014 at 08:24:44PM +0530, sujith h wrote:
> Hi,
> 
> I am using the ligbles-omap3/5.01.01.01 for core-image-sato for the machine
> Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I got Qt5 built for the
> machine ( taken from meta-qt5). I am not able to run opengl examples of Qt5
> and hence as a result the examples from qtdeclarative are also failing. The
> error I get here is:
> 
> root@mel-am335x-boneblack:/usr/share/qt5/examples#
> ./opengl/hellowindow/hellowindow -platform xcb Qt Warning: Could not find a
> location of the system's Compose files. Consider setting the QTCOMPOSE
> environment variable. Qt Warning: Could not find a location of the system's
> Compose files. Consider setting the QTCOMPOSE environment variable. Cant
> find EGLConfig, returning null config Cant find EGLConfig, returning null
> config EGL did not suggest a VisualID (EGL_NATIVE_VISUAL_ID was zero) for
> EGLConfig 0 Unable to find an X11 visual which matches EGL config 0 Could
> not initialize EGL Aborted root@mel-am335x-boneblack:/usr/share/qt5/examples#
> 
> 
> May I know if the libgles-omap3 5.01.01.01 can be used with X11 or not? Or
> any helpers what could be wrong here? If any more inputs are needed please
> let me know.

X11 is supposed to be supported by 5.1.1.1 graphics stack, but it hasn't been 
tested, especially the DRM part. We've switched from Raw framebuffer use case 
directly to Wayland one in our SDK products, so no X11 exposure here.

-- 
Denys

