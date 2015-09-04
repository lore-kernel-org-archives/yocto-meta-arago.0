Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E4F6752AFD
	for <meta-arago@arago-project.org>;
	Fri,  4 Sep 2015 22:34:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t84MYaKo025181
	for <meta-arago@arago-project.org>; Fri, 4 Sep 2015 17:34:36 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t84MYahu032606
	for <meta-arago@arago-project.org>; Fri, 4 Sep 2015 17:34:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Sep 2015 17:34:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t84MYajF004049;
	Fri, 4 Sep 2015 17:34:36 -0500
Date: Fri, 4 Sep 2015 18:34:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150904223420.GU4305@edge>
References: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
	<55DC6FC5.7090407@ti.com> <55DF0EEB.1060809@ti.com>
	<55E85EE8.5020806@ti.com>
MIME-Version: 1.0
In-Reply-To: <55E85EE8.5020806@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2 0/5] TI OpenCL
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
X-List-Received-Date: Fri, 04 Sep 2015 22:34:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Yes, I remember. But there's been too many issues lately with our builds, so I 
don't want to introduce another variable until I get everything working and 
unblock the test team. Sorry.

-- 
Denys


On Thu, Sep 03, 2015 at 10:53:28AM -0400, Jacob Stiffler wrote:
> Ping.
> 
> On 8/27/2015 9:21 AM, Jacob Stiffler wrote:
> >Ping
> >
> >On 8/25/2015 9:38 AM, Jacob Stiffler wrote:
> >>Ping.
> >>
> >>On 8/19/2015 9:58 AM, Jacob Stiffler wrote:
> >>>This patch set provides the complte set of OpenCL packages for
> >>>TI devices.
> >>>
> >>>v2 changes: Update descrption and homepage.
> >>>
> >>>Jacob Stiffler (5):
> >>>   clocl: Add opencl kernel compiler.
> >>>   opencl-monitor: Add opencl monitor firmware
> >>>   ocl-gl-headers: Add GL headers required for opencl.
> >>>   opencl: Add the opencl library
> >>>   opencl-examples: Add the opencl examples.
> >>>
> >>>  meta-arago-extras/recipes-ti/ocl/clocl_git.bb      |    34 +
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/gl.h          |  2235 ++++
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h   |  2311 ++++
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/glext.h       | 10776
> >>>+++++++++++++++++++
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/glx.h         |   513 +
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h  |    82 +
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/glxext.h      |  1001 ++
> >>>  .../ocl/ocl-gl-headers/GL/internal/dri_interface.h |  1189 ++
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h      |   283 +
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/wglext.h      |   901 ++
> >>>  .../recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h       |   140 +
> >>>  .../recipes-ti/ocl/ocl-gl-headers_git.bb           |    25 +
> >>>  meta-arago-extras/recipes-ti/ocl/ocl.inc           |    10 +
> >>>  .../recipes-ti/ocl/opencl-examples_git.bb          |    77 +
> >>>  .../recipes-ti/ocl/opencl-monitor_git.bb           |    58 +
> >>>  meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |    55 +
> >>>  16 files changed, 19690 insertions(+)
> >>>  create mode 100644 meta-arago-extras/recipes-ti/ocl/clocl_git.bb
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glext.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glxext.h
> >>>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/internal/dri_interface.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wglext.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
> >>>  create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl.inc
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
> >>>  create mode 100644
> >>>meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> >>>  create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> >>>
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

