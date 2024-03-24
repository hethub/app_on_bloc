import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes/paths.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/movies_entities.dart';

class MovieListing extends StatelessWidget {
  final MoviesEntities result;

  const MovieListing({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          context.pushNamed(
            PTH.detail,
            pathParameters: {
              'movieId': result.id!.toString(),
            },
          );
        },
        child: CachedNetworkImage(
          imageUrl: '${AC.kDefaultImage}/${result.posterPath}',
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
              ),
              child: Center(
                  child: CircularProgressIndicator(
                value: downloadProgress.progress,
              )),
            );
          },
          errorWidget: (context, url, error) => Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const Icon(Icons.error),
          ),
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8))),
                    child: Text(
                      result.title ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          overflow: TextOverflow.ellipsis),
                    )),
                const Spacer(),
                Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Avg. vote : ${result.voteAverage}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Date : ${result.releaseDate}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
